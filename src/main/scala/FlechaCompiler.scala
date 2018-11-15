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
        env = env.+((name, BRegister(s"@$name"))) // name -> $G_name
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
      case LowerIdAST(value)                                => if(isNativeOp(value) || isNativeFunction(value)) List() else List(value)
      case _                                                => List()
    }).filter( fv => !excluded.contains(fv)).toSet
  }

  def isNativeOp(value: String) = {
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
    val defRegName = s"@$defName"

    code + mov_reg(defRegName, "$" + s"r$reg")
  }

  def compileVariable(variableName: String, reg: Int) = {
    val defRegName = s"@$variableName"
    val regStr = "$" + s"r$reg"

    if (env.get(variableName).nonEmpty) {
      env(variableName) match {
        case BEnclosed(reg2)     => mov_reg(regStr, "$" + s"r$reg2")
        case _                   => mov_reg(regStr, defRegName)
      }
    } else mov_reg(regStr, defRegName)
  }

  def compileConstructor(constructorName: String, reg: Int) = {
    createConstructor(constructorName, 0)

    alloc("$" +s"r$reg", 1) +
    mov_int(temp, getTag(constructorName)) +
    store("$" +s"r$reg", 0, temp)
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

  def compileBranch(branch: AST, tagBranch: String, tagEndCase: String, reg: Int) = {
    s"$tagBranch:\n" +
    compileAst(branch, reg) +
    jump(tagEndCase)
  }

  def compileBranchs(caseBranchs: List[AST], reg: Int) = {
    val tagEndCase = nextEndCase
    var compiledBranchs: List[String] = List()

    val compareBranchs = caseBranchs.map {
      branch =>
        val tagBranch = newBranchName ;
        val compiledBranch = compileBranch(branch, tagBranch, tagEndCase, reg) ;
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
    compileBranchs(caseBranchs, reg)
  }


  def obtainStructureHead(ast: AST): String = {
    ast match {
      case UpperIdAST(name)           => name
      case AppExprAST(atomicOp, _)    => obtainStructureHead(atomicOp)
      case _                          => error()
    }
  }

  def obtainStructureArg(ast: AST, list: List[AST]) :List[AST] = {
    ast match {
      case UpperIdAST(name)                    => list
      case AppExprAST(atomicOp, argument)      => obtainStructureArg(atomicOp, List(argument)) ++ list
      case _                                   => error()
    }
  }

  def compileStructure(atomicOp: AST, appExprAST: AST, reg: Int) = {
    val constructorName = obtainStructureHead(atomicOp)
    val params: List[AST] = obtainStructureArg(atomicOp, List(appExprAST))
    val paramsRegs = params.map(_ => newReg)

    createConstructor(constructorName, params.size)

    params.zipWithIndex.map { case (param, index) => compileAst(param, paramsRegs(index)) }.mkString +
    alloc("$" +s"r$reg", 1 + arity(constructorName)) +
    mov_int(temp, getTag(constructorName)) +
    store("$" +s"r$reg", 0, temp) +
    params.zipWithIndex.map { case (_, index) => store("$" +s"r$reg", 1 + index, "$" +s"r${paramsRegs(index)}") }.mkString
  }

  //////////////////////////// NATIVE OPERATIONS /////////////////////


  /////////////////////////// UNARY OPERATIONS ///////////////////////
  def compileMinus(arg1: AST, reg: Int) = {
    val nReg = newReg
    val argCode = compileAst(arg1, nReg)
    val t1 = "$" +s"temp1"

    argCode +
    load(temp, "$" +s"r$nReg", 1) +
    mov_int(t1, -1) +
    mul(t1, t1, temp) +
    compileNumber(t1, "$" +s"r$reg")
  }

  def compileNot(arg1: AST, reg: Int) = {
    val nReg = newReg
    val argCode = compileAst(arg1, nReg)

    val branch1 = newBranchName
    val branch2 = newBranchName
    val endCase = nextEndCase

    argCode +
    load("$" +s"$reg", "$" +s"$nReg", 0) +
    mov_int(test, getTag("True")) +
    jump_eq("$" +s"$reg", test, branch1) +
    mov_int(test, getTag("False")) +
    jump_eq("$" +s"$reg", test, branch2) +
      s"$branch2:\n" +
      compileConstructor("True", reg) +
      jump(endCase) +
      s"$branch1:\n" +
      compileConstructor("False", reg) +
      jump(endCase) +
      s"$endCase:\n"
  }

  /////////////////////////// BINARY OPERATIONS //////////////////////
  def compileOR(firstReg: String, secondReg: String, reg: Int) = {
    val trueBranch = newBranchName
    val falseBranch = newBranchName
    val endCase = nextEndCase

    mov_int(test, getTag("True")) +
    jump_eq(firstReg, test, trueBranch) +
    jump_eq(secondReg, test, trueBranch) +
    jump(falseBranch) +
    s"$trueBranch:\n" +
    compileConstructor("True", reg) +
    jump(endCase) +
    s"$falseBranch:\n" +
    compileConstructor("False", reg) +
    jump(endCase) +
    s"$endCase:\n"
  }

  def compileAND(firstReg: String, secondReg: String, reg: Int) = {
    val trueBranch = newBranchName
    val falseBranch = newBranchName
    val endCase = nextEndCase

    mov_int(test, getTag("True")) +
      jump_eq(firstReg, test, trueBranch) +
      jump(falseBranch) +
      s"$trueBranch:\n" +
      mov_int(test, getTag("False")) +
      jump_eq(secondReg, test, falseBranch) +
      compileConstructor("True", reg) +
      jump(endCase) +
      s"$falseBranch:\n" +
      compileConstructor("False", reg) +
      jump(endCase) +
      s"$endCase:\n"
  }
  def compileEQ(firstReg: Int, secondReg: Int, reg: Int) = {""}
  def compileNE(firstReg: Int, secondReg: Int, reg: Int) = {""}
  def compileLE(firstReg: Int, secondReg: Int, reg: Int) = {""}
  def compileGE(firstReg: Int, secondReg: Int, reg: Int) = {""}
  def compileGT(firstReg: Int, secondReg: Int, reg: Int) = {""}
  def compileLT(firstReg: Int, secondReg: Int, reg: Int) = {""}


  def compileUnaryOp(operation: String, arg1: AST, reg: Int) = {
    operation match {
      case "UMINUS" => compileMinus(arg1, reg)
      case "NOT"    => compileNot(arg1, reg)
    }
  }

  def compileNumber(value: String, goalReg: String) = {
      alloc(goalReg, 2) +
      mov_int(temp, getTag("Int")) +
      store(goalReg, 0, temp) +
      store(goalReg, 1, value)
  }

  def compileBinaryBooleanOp(operation: String, firstArg: Int, secondArg: Int, reg: Int) = {
    val t1 = newReg
    val t2 = newReg

    load("$" +s"r$t1", "$" +s"r$firstArg", 0) +
    load("$" +s"r$t2", "$" +s"r$secondArg", 0) +
      (operation match {
      case "OR"    => compileOR("$" +s"r$t1", "$" +s"r$t2", reg)
      case "AND"   => compileAND("$" +s"r$t1", "$" +s"r$t2", reg)
      case "EQ"    => ""
      case "NE"    => ""
      case "GE"    => ""
      case "LE"    => ""
      case "GT"    => ""
      case "LT"    => ""
    })
  }

  def compileBinaryAritmeticOp(operation: String, firstArg: Int, secondArg: Int, reg: Int) = {
    val t1 = newReg
    val t2 = newReg
    val goal = newReg

    load("$" +s"r$t1", "$" +s"r$firstArg", 1) +
    load("$" +s"r$t2", "$" +s"r$secondArg", 1) +
      (operation match {
        case "ADD"    => add("$" +s"r$goal", "$" +s"r$t1", "$" +s"r$t2") + compileNumber("$" +s"r$goal", "$" +s"r$reg")
        case "SUB"    => sub("$" +s"r$goal", "$" +s"r$t1", "$" +s"r$t2") + compileNumber("$" +s"r$goal", "$" +s"r$reg")
        case "MUL"    => mul("$" +s"r$goal", "$" +s"r$t1", "$" +s"r$t2") + compileNumber("$" +s"r$goal", "$" +s"r$reg")
        case "DIV"    => div("$" +s"r$goal", "$" +s"r$t1", "$" +s"r$t2") + compileNumber("$" +s"r$goal", "$" +s"r$reg")
        case "MOD"    => mod("$" +s"r$goal", "$" +s"r$t1", "$" +s"r$t2") + compileNumber("$" +s"r$goal", "$" +s"r$reg")
      })
  }

  def compileBinaryOp(operation: String, secondArg: AST, firstArg: AST, reg: Int) = {
    val firstArgReg = newReg
    val secondArgReg = newReg

    compileAst(firstArg, firstArgReg) +
    compileAst(secondArg, secondArgReg) +
      (operation match {
      case "OR" | "AND" | "EQ" | "NE" | "GE" | "LE" | "GT" | "LT"     => compileBinaryBooleanOp(operation, firstArgReg, secondArgReg, reg)
      case "ADD"| "SUB" | "MUL"| "DIV"| "MOD"                         => compileBinaryAritmeticOp(operation, firstArgReg, secondArgReg, reg)
    })
  }

  def isPrimitiveApp(ast: AST): Boolean = {
    ast match {
      case LowerIdAST(id)           => isNativeOp(id)
      case AppExprAST(atomicOp, _)  => isPrimitiveApp(atomicOp)
      case _                        => false
    }
  }


  def compilePrimitiveFunction(func: AST, firstArg: AST, reg: Int) :String = {
    func match {
      case LowerIdAST(id)                               => compileUnaryOp(id, firstArg, reg)
      case AppExprAST(LowerIdAST(id), secondArg)        => compileBinaryOp(id, firstArg, secondArg, reg)
      case _                                            => error()
    }
  }

  //////////////////////////// NATIVE OPERATIONS /////////////////////

  def isStructure(ast: AST): Boolean = {
    ast match {
      case UpperIdAST(_)           => true
      case AppExprAST(atomicOp, _) => isStructure(atomicOp)
      case _                       => false
    }
  }

  def compileApplication(atomicOp: AST, appExprAST: AST, reg: Int) :String = {
    if(isStructure(atomicOp)) { compileStructure(atomicOp, appExprAST, reg) } else {
      if(isPrimitiveApp(atomicOp)) { compilePrimitiveFunction(atomicOp, appExprAST, reg) } else {
          atomicOp match {
            case LowerIdAST(value)                      => if(isNativeFunction(value)) compileNativeFunctionApp(value, appExprAST, reg) else compileSimpleApp(value, appExprAST, reg)
            case AppExprAST(_, _) |
                UnaryWithParenAST(LambdaAST(_, _))     => compileLambdaApp(atomicOp, appExprAST, reg)
            case _                                      => error()
          }
      }
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
  def add(reg: String, reg2: String, reg3: String)       = s"add($reg, $reg2, $reg3)\n"
  def sub(reg: String, reg2: String, reg3: String)       = s"sub($reg, $reg2, $reg3)\n"
  def mul(reg: String, reg2: String, reg3: String)       = s"mul($reg, $reg2, $reg3)\n"
  def div(reg: String, reg2: String, reg3: String)       = s"div($reg, $reg2, $reg3)\n"
  def mod(reg: String, reg2: String, reg3: String)       = s"mod($reg, $reg2, $reg3)\n"

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  def error(msg: String = "") = throw new FlechaCompileError(msg)
}

class FlechaCompileError(val msg: String) extends Exception(s"Compile error: $msg")
