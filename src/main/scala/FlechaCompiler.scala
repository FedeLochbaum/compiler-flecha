import ast._

case class FlechaCompiler(AST: AST) {

  type MamarrachoProgram = String

  val temp = "$" + "t"
  val tag  = "$" + "tag"
  val test = "$" + "test"
  val tval = "$" + "val"
  val fun  = "$" + "fun"
  val arg  = "$" + "arg"

  val initialTagMap: Map[String, Int] = Map(
    "Int"     -> 1,
    "Char"    -> 2,
    "Closure" -> 3,
    "True"    -> 4,
    "False"   -> 5,
    "Nil"     -> 6,
    "Cons"    -> 7,
  )

  val initialArity: Map[String, Int] = Map(
    "Int"     -> 0,
    "True"    -> 0,
    "False"   -> 0,
    "Nil"     -> 0,
    "Cons"    -> 2,
  )

  var arity: Map[String, Int] = initialArity
  var tagMap: Map[String, Int] = initialTagMap
  var env : Map[String, Binding] = Map()

  var branchNumber = 0
  var endCase = 0
  var rtn = -1
  var count = 0
  var nextTag = 7
  var routinesStore: List[String] = List()

  def nextRtn= { rtn = rtn + 1 ; rtn }
  def newReg = { count = count + 1 ; count }
  def newTag = { nextTag = nextTag + 1 ; nextTag }
  def newBranchName = { branchNumber = branchNumber + 1 ; s"branch$branchNumber" }
  def nextEndCase = { endCase = endCase + 1 ; s"END_CASE$endCase" }

  def restartState = {
    count = 0
    endCase = 0
    branchNumber = 0
    nextTag = 7
    rtn = -1
    tagMap = initialTagMap
    arity = initialArity
    routinesStore = List()
    initialEnv
  }

  def initialEnv ={
    AST match {
      case ProgramAST(defs) => defs.foreach(ast => intialRegister(ast))
      case _                => error()
    }
  }

  def intialRegister(ast: AST) = {
    ast match {
      case DefAST(name, expr) =>
        env = env.+((name, BRegister("$" + s"G_$name"))) // name -> $G_name
    }
  }

  def createTag(string: String) = {
    val tag = newTag
    tagMap = tagMap.+((string, tag))
    tag
  }

  def createConstructor(constructor: String, args: Int) = {
    if (tagMap.get(constructor).isEmpty) { createTag(constructor) }
    if (arity.get(constructor).isEmpty) { arity = arity.+((constructor, args)) }
  }

  def getTag(string: String): Int = {
    val tag = tagMap.get(string)
    if (tag.isEmpty) { createTag(string) } else tag.get
  }

  def tagOf(branch: AST): Int = {
    branch match {
      case CaseBranchAST(constructor, _, _) => getTag(constructor)
      case _                                => error()
    }
  }

  def freeValues(ast: AST, excluded: Set[String]): Set[String] = {
    (ast match {
      case LetAST(name, internalExpr, externalExp)          => freeValues(internalExpr, excluded) ++ freeValues(externalExp, excluded ++ List(name))
      case AppExprAST(atomicOp, appExprAST)                 => freeValues(atomicOp, excluded) ++ freeValues(appExprAST, excluded)
      case LambdaAST(name, externalExp)                     => freeValues(externalExp, excluded ++ List(name))
      case CaseBranchAST(_, _, internalExpr)                => freeValues(internalExpr, excluded)
      case CaseAST(internalExpr, _)                         => freeValues(internalExpr, excluded)
      case UnaryWithParenAST(expr)                          => freeValues(expr, excluded)
      case LowerIdAST(value)                                => if(isBinaryOp(value) || isNativeFunction(value)) List() else List(value)
      case _                                                => List()
    }).filter( fv => !excluded.contains(fv)).toSet
  }

  def isBinaryOp(value: String) = {
    value match {
      case "OR"  | "AND" | "NOT"| "EQ" |
           "NE"  | "GE"  | "LE" | "GT" |
           "LT"  | "ADD" | "SUB"| "MUL"|
           "DIV" | "MOD" | "UMINUS"         => true
      case _                                => false
    }
  }

  def isNativeFunction(value: String) = {
    value match {
      case "unsafePrintChar" |
           "unsafePrintInt"                => true
      case _                               => false
    }
  }

  ///////////////////////////////////// FINISH COMPILER STATE FUNCTIONALITY //////////////////////////////////////


  def compile : MamarrachoProgram = {
    restartState
    AST match {
      case ProgramAST(defs) => {
        val code = defs.reverse.map(ast => compileAst(ast, newReg)).mkString
        jump("main") + routinesStore.mkString + s"main:\n" + code
      }
      case _                 => error()
    }
  }

  def loadVariable(variable: String, index: Int, reg: Int): String = {
    env = env.+((variable, BEnclosed(reg)))
    load("$" + s"r$reg", "$fun", index + 2)
  }

  def compileFreeVariable(variable: String, index: Int, str: String) = {
    env(variable) match {
      case BEnclosed(regI) => store(str, index + 2, "$" + s"r$regI")
      case _               => error("Expected a BEclosed with reg")
    }
  }

  def loadFreeValues(list: List[String]) = {
    list.zipWithIndex.map { case (variable, index) => loadVariable(variable, index, newReg) }.mkString
  }

  def compileFreeValuesInitialization(list: List[String], str: String) = {
    list.zipWithIndex.map { case (variable, index) => compileFreeVariable(variable, index, str) }.mkString
  }

  def compileAst(ast: AST, reg: Int) :String = {
    ast match {
      case DefAST(name, expr)                               => compileDef(name, expr, reg)
      case CharAST(value)                                   => compileChar(value, reg)
      case NumberAST(value)                                 => compileInt(value, reg)
      case AppExprAST(atomicOp, appExprAST)                 => compileApplication(atomicOp, appExprAST, reg)
      case LowerIdAST(value)                                => compileVariable(value, reg)
      case LetAST(name, internalExpr, externalExp)          => compileLet(name, internalExpr, externalExp, reg)
      case UnaryWithParenAST(expr)                          => compileAst(expr, reg)
      case LambdaAST(name, externalExp)                     => compileLambda(name, externalExp, reg)
      case UpperIdAST(value)                                => compileConstructor(value, reg)
      case CaseAST(internalExpr, caseBranchs)               => compileCase(internalExpr, caseBranchs, reg)
      case CaseBranchAST(constructor, params, internalExpr) => compileCaseBranch(constructor, params, internalExpr, reg)
      case _                                                => error()
    }
  }

  def compileLambdaDefinition(name: String, externalExp: AST, reg: Int, routine: String) = {
    val regStr = "$" + s"r$reg"
    val fvs = freeValues(externalExp, Set(name))
    val argReg = newReg

    val currentEnv = env
    env = env.+((name, BEnclosed(argReg)))
    val subExprCompiled = loadFreeValues(fvs.toList) + compileAst(externalExp, reg)
    env = currentEnv

    s"$routine:\n" +
    mov_reg(fun, "@fun") +
    mov_reg(arg, "@arg") +
    mov_reg("$" + s"r$argReg", arg) +
    subExprCompiled +
    mov_reg("@res", regStr) +
    ret()
  }

  def compileLambda(name: String, externalExp: AST, reg: Int) = {
    val regStr = "$" + s"r$reg"
    val fvs = freeValues(externalExp, Set(name))
    val routine = s"rtn$nextRtn"
    val subExpReg = newReg

    val defRoutine = compileLambdaDefinition(name, externalExp, subExpReg, routine)
    routinesStore = routinesStore ++ List(defRoutine)

    alloc(regStr, 2 + fvs.size) +
    mov_int(temp, getTag("Closure")) +
    store(regStr, 0, temp) +
    mov_label(temp, routine) +
    store(regStr, 1, temp) +
    compileFreeValuesInitialization(fvs.toList, regStr)
  }

  def compileLet(name: String, internalExpr: AST, externalExp: AST, reg: Int) = {
    val subExpReg = newReg
    val subExpReg2 = newReg
    val e1 = compileAst(internalExpr, subExpReg)
    val currentVal = env.get(name)

    env = env.+((name, BEnclosed(subExpReg)))

    val e2 = compileAst(externalExp, subExpReg2)
    if(currentVal.isEmpty) { env = env.-(name) } else { env = env.+((name, currentVal.get)) }
    e1 + e2 + mov_reg("$" + s"r$reg", "$" + s"r$subExpReg2")
  }

  def compileDef(defName: String, subExpr: AST, reg: Int) = {
    env = env.+((defName, BEnclosed(reg)))
    val code = compileAst(subExpr, reg)
    val defRegName = "$" + s"G_$defName"

    code + mov_reg(defRegName, "$" + s"r$reg")
  }

  def compileVariable(variableName: String, reg: Int) = {
    val defRegName = "$" + s"G_$variableName"
    val regStr = "$" + s"r$reg"

    if (env.get(variableName).nonEmpty) {
      env(variableName) match {
        case BEnclosed(reg2)     => mov_reg(regStr, "$" + s"r$reg2")
        case _                   => error()
      }
    } else mov_reg(regStr, defRegName)
  }

  def compileConstructor(constructorName: String, reg: Int) = {
    if(tagMap.get(constructorName).isEmpty) { tagMap = tagMap.+((constructorName, newTag)) ; arity = arity.+((constructorName, 0)) }

    alloc("$" +s"r$reg", 1) +
      mov_int(temp, getTag(constructorName)) +
      store("$" +s"r$reg", 0, temp)
  }

  def compileBranch(branch: AST, tagBranch: String, tagEndCase: String) = {
    s"$tagBranch:\n" +
    compileAst(branch, newReg) +
    jump(tagEndCase)
  }

  def compileBranchs(caseBranchs: List[AST]) = {
    val tagEndCase = nextEndCase
    var compiledBranchs: List[String] = List()

    val compareBranchs = caseBranchs.map {
      branch =>
        val tagBranch = newBranchName ;
        val compiledBranch = compileBranch(branch, tagBranch, tagEndCase) ;
        compiledBranchs = compiledBranchs ++ List(compiledBranch) ;

        mov_int(test, tagOf(branch)) +
        jump_eq(tag, test, tagBranch)
    }.mkString

    compareBranchs +
    compiledBranchs.mkString +
    s"$tagEndCase:\n"
  }

  def compileCase(internalExpr: AST, caseBranchs: List[AST], reg: Int) = {
    val eReg = newReg

    compileAst(internalExpr, eReg) +
    mov_reg(tval, "$" + s"r$eReg") +
    load(tag, tval, 0) +
    compileBranchs(caseBranchs)
  }

  def loadConstructorVariable(variable: String, index: Int, reg: Int): String = {
    env = env.+((variable, BEnclosed(reg)))
    load("$" + s"r$reg", tval, index + 1)
  }

  def loadBranchArgs(params: List[String]) = {
    params.zipWithIndex.map { case (variable, index) => loadConstructorVariable(variable, index, newReg) }.mkString
  }

  def compileCaseBranch(constructor: String, params: List[String], internalExpr: AST, reg: Int) = {
    createConstructor(constructor, params.length)
    if (arity(constructor) != params.length ) error(s"expected ${arity(constructor)} arguments")
    val currentEnv = env
    val ret = loadBranchArgs(params) + compileAst(internalExpr, reg)
    env = currentEnv

    ret
  }

  def compileApplication(atomicOp: AST, appExprAST: AST, reg: Int) :String = {
    atomicOp match {
      case LowerIdAST(value)                      => if(isNativeFunction(value)) compileNativeFunctionApp(value, appExprAST, reg) else compileSimpleApp(value, appExprAST, reg)
      case UpperIdAST(value)                      => compileConstructorApp(value, appExprAST, reg)
      case AppExprAST(_, _) |
           UnaryWithParenAST(LambdaAST(_, _))     => compileLambdaApp(atomicOp, appExprAST, reg)
      case _                                      => error()
    }
  }

  def compileLambdaApp(lambda: AST, expr: AST, reg: Int) = {
      val lambdaReg = newReg
      val argReg = newReg

      compileAst(lambda, lambdaReg) +
      compileAst(expr, argReg) +
      mov_reg("@fun", "$" + s"r$lambdaReg") +
      mov_reg("@arg", "$" + s"r$argReg") +
      load(temp, "$" + s"r$lambdaReg", 1) +
      icall(temp) + mov_reg( "$" +s"r$reg", "@res")
  }

  def compileConstructorApp(constructorName: String, appExprAST: AST, reg: Int) = {
    error("const app")
//    val constReg = newReg
//    val argReg = newReg
//
//    //    checkOrUpdateArity(String, appExprAST)
//
//    // TODO: REVISAR, PENSAR COMO RESOLVERLO
//    compileConstructor(constructorName, constReg)
//    compileAst(appExprAST, argReg) +
//    alloc("$" +s"r$reg", 1 + arity(constructorName)) +
//    mov_int(temp, getTag(constructorName)) +
//    store("$" +s"r$reg", 0, temp) +
//    store("$" +s"r$reg", 1, "$" +s"r$constReg") +
//    store("$" +s"r$reg", 2, "$" +s"r$argReg")
  }

  def compileNativeFunctionApp(funcName: String, appExprAST: AST, reg: Int) = {
    val regStr = "$" + s"r$reg"
    val nextReg = "$" + s"r$newReg"

    compileAst(appExprAST, reg) +
      (funcName match {
      case "unsafePrintChar" => load(nextReg, regStr, 1) + print_char(nextReg)
      case "unsafePrintInt"  => load(nextReg, regStr, 1) + print_int(nextReg)
      case  _                => error()
    })
  }

  def compileSimpleApp(funcName: String, appExprAST: AST, reg: Int) = {
    val funcReg = newReg
    val argReg = newReg

    compileVariable(funcName, funcReg) +
    compileAst(appExprAST, argReg) +
    mov_reg("@fun", "$" + s"r$funcReg") +
    mov_reg("@arg", "$" + s"r$argReg") +
    load(temp, "$" + s"r$funcReg", 1) +
    icall(temp) + mov_reg( "$" +s"r$reg", "@res")
  }

  def compileChar(char: Char, reg: Int) = {
    val regStr = "$" + s"r$reg"

    alloc(regStr, 2) +
    mov_int(temp, getTag("Char")) +
    store(regStr, 0, temp) +
    mov_int(temp, char.toByte.toInt) +
    store(regStr, 1, temp)
  }

  def compileInt(int: Int, reg: Int) = {
    val regStr = "$" + s"r$reg"

    alloc(regStr, 2) +
    mov_int(temp, getTag("Int")) +
    store(regStr, 0, temp) +
    mov_int(temp, int) +
    store(regStr, 1, temp)
  }

  //////////////////////////////////// MAMARRACHO AUX FUNCTIONS ///////////////////////////////////////////////
  def alloc(reg: String, slots: Int)                     = s"alloc($reg, $slots)\n"
  def mov_int(reg: String, tag: Int)                     = s"mov_int($reg, $tag)\n"
  def print_char(reg: String)                            = s"print_char($reg)\n"
  def print_int(reg: String)                             = s"print($reg)\n"
  def mov_reg(reg1: String, reg2: String)                = s"mov_reg($reg1, $reg2)\n"
  def store(reg1: String, index: Int, reg2: String)      = s"store($reg1, $index, $reg2)\n"
  def load(reg1: String, reg2: String, index: Int)       = s"load($reg1, $reg2, $index)\n"
  def mov_label(reg: String, label: String)              = s"mov_label($reg, $label)\n"
  def ret()                                              = s"return()\n"
  def call(label: String)                                = s"call($label)\n"
  def icall(reg: String)                                 = s"icall($reg)\n"
  def jump(label: String)                                = s"jump($label)\n"
  def jump_eq(reg1: String, reg2: String, label: String) = s"jump_eq($reg1, $reg2, $label)\n"

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  def error(msg: String = "") = throw new FlechaCompileError(msg)
}

class FlechaCompileError(val msg: String) extends Exception(s"Compile error: $msg")
