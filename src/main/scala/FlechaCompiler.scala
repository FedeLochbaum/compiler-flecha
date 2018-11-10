import ast._

case class FlechaCompiler(AST: AST) {

  type MamarrachoProgram = String

  val temp = "$" + "t"
  val fun  = "$" + "fun"
  val arg  = "$" + "arg"

  val initialTagMap = Map(
    "Int"     -> 1,
    "Char"    -> 2,
    "Closure" -> 3,
    "True"    -> 4,
    "False"   -> 5,
    "Nil"     -> 6,
    "Cons"    -> 7,
  )

  var tagMap = initialTagMap
  var env : Map[String, Binding] = Map()

  var rtn = -1
  var count = 0
  var nextTag = 7

  def nextRtn= { rtn = rtn + 1 ; rtn }
  def newReg = { count = count + 1 ; count }
  def newTag = { nextTag = nextTag + 1 ; nextTag }

  def restartState = {
    count = 0
    nextTag = 7
    rtn = -1
    tagMap = initialTagMap
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

  def getTag(string: String): Int = {
    val tag = tagMap.get(string)
    if (tag.isEmpty) { createTag(string) } else tag.get
  }

  def freeValues(ast: AST, lambdaParam: String) = {
    ast match {
      case DefAST(name, expr)                               => List()
      case CharAST(value)                                   => List()
      case NumberAST(value)                                 => List()
      case AppExprAST(atomicOp, appExprAST)                 => List()
      case LowerIdAST(value)                                => List()
      case LetAST(name, internalExpr, externalExp)          => List()
      case LambdaAST(name, externalExp)                     => List()
      case UpperIdAST(value)                                => List()
      case CaseBranchAST(constructor, params, internalExpr) => List()
      case CaseAST(internalExpr, caseBranchs)               => List()
      case UnaryWithParenAST(expr)                          => List()
      case _                                                => List()
    }
  }

  ///////////////////////////////////// FINISH COMPILER STATE FUNCTIONALITY //////////////////////////////////////


  def compile : MamarrachoProgram = {
    restartState
    AST match {
      case ProgramAST(defs) => jump("main") + compileRoutinesDef(defs.reverse) + s"main:\n" + defs.reverse.map(ast => compileAst(ast, newReg)).mkString
      case _                 => error()
    }
  }

  def compileRoutinesDef(asts: List[AST]) = {
    val res = asts.map(ast => compileRoutines(ast)).mkString ; rtn = -1 ; res
  }

  def compileRoutines(ast: AST): String = {
    ast match {
      case LambdaAST(name, externalExp)                     => compileLambdaDefinition(name, externalExp, newReg)
      case DefAST(_, expr)                                  => compileRoutines(expr)
      case AppExprAST(atomicOp, appExprAST)                 => compileRoutines(atomicOp) + compileRoutines(appExprAST)
      case LetAST(_, internalExpr, externalExp)             => compileRoutines(internalExpr) + compileRoutines(externalExp)
      case CaseBranchAST(_, _, internalExpr)                => compileRoutines(internalExpr)
      case CaseAST(internalExpr, caseBranchs)               => compileRoutines(internalExpr) + caseBranchs.map( ast => compileRoutines(ast))
      case UnaryWithParenAST(expr)                          => compileRoutines(expr)
      case _                                                => ""
    }
  }

  def compileFreeValues(list: List[String]) = {
    ""
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
      case UpperIdAST(value)                                => ""
      case CaseBranchAST(constructor, params, internalExpr) => ""
      case CaseAST(internalExpr, caseBranchs)               => ""
      case _                                                => error()
    }
  }

  def compileLambdaDefinition(name: String, externalExp: AST, reg: Int) = {
    val regStr = "$" + s"r$reg"
    val routine = s"rtn$nextRtn"
    val fv = freeValues(externalExp, name)
    val argReg = newReg

    val currentVal = env.get(name)
    env = env.+((name, BEnclosed(argReg))) // El reg donde estara el valor de $arg, es decir, el valor de name
    val subExprCompiled = compileAst(externalExp, reg)
    if(currentVal.isEmpty) { env = env.-(name) } else { env = env.+((name, currentVal.get)) }

    compileRoutines(externalExp) +
    s"$routine:\n" +
    mov_reg(fun, "@fun") +
    mov_reg(arg, "@arg") +
    mov_reg("$" + s"r$newReg", arg) +
    compileFreeValues(fv) + // compila las freevalues y las guarda en env
    subExprCompiled +
    mov_reg("@res", regStr) +
    ret()
  }


  def compileLambda(name: String, externalExp: AST, reg: Int) = {
    val regStr = "$" + s"r$reg"
    val fv = freeValues(externalExp, name)
    val routine = s"rtn$nextRtn"
//    val values = lookUpValues(externalExp).map( value => ).mkString

    alloc(regStr, 2 + fv.size) +
    mov_int(temp, getTag("Closure")) +
    store(regStr, 0, temp) +
    mov_label(temp, routine) +
    store(regStr, 1, temp)
    // Por cada variable libre setear su valor en r1[i] (que en la def de la rutina fueron compiladas en elgun registro y guardadas en env)
  }


  def compileApplication(atomicOp: AST, appExprAST: AST, reg: Int) :String = {
    atomicOp match {
      case LowerIdAST(value)                      => compileAst(appExprAST, reg+1) + compileLowerIdApp(value, reg+2)
      case UpperIdAST(value)                      => compileAst(appExprAST, reg+1) + ""
      case AppExprAST(atomic, expr)               => compileAst(appExprAST, reg+1) + compileApplication(atomic, expr, reg+2)
      case UnaryWithParenAST(LambdaAST(name, e2)) =>
                                                  compileAst(atomicOp, reg+2) +
                                                  compileAst(appExprAST, reg+1) +
                                                  mov_reg("@fun", "$" + s"r${reg+2}") +
                                                  mov_reg("@arg", "$" + s"r${reg+1}") +
                                                  load(temp, "$" + s"r${reg+2}", 1) +
                                                  icall(temp) + mov_reg( "$" +s"r$reg", "@res")
      case _                                      => error()
    }
  }

  def compileLet(name: String, internalExpr: AST, externalExp: AST, reg: Int) = {
    val e1 = compileAst(internalExpr, reg+1)
    val currentVal = env.get(name)

    env = env.+((name, BEnclosed(reg+1)))

    val e2 = compileAst(externalExp, reg+2)
    if(currentVal.isEmpty) { env = env.-(name) } else { env = env.+((name, currentVal.get)) }
    e1 + e2 + mov_reg("$" + s"r$reg", "$" + s"r${reg+2}")
  }

  def compileDef(defName: String, subExpr: AST, reg: Int) = {
    val code = compileAst(subExpr, reg)
    val defRegName = s"G_$defName"
    env = env.+((defName, BEnclosed(reg)))

    code + mov_reg("$" + defRegName, "$" + s"r$reg")
  }

  def compileVariable(variableName: String, reg: Int) = {
    val defRegName = "$" + s"G_$variableName"
    val regStr = "$" + s"r$reg"

    if (env.get(variableName).nonEmpty) {
      env(variableName) match {
        case BEnclosed(reg2)     => mov_reg(regStr, "$" + s"r$reg2")
        case BRegister(register) => ""
        case _                   => ""
      }
    } else ""
  }

  def compileLowerIdApp(funcName: String, reg: Int) = {
    val prevRegStr = "$" + s"r${reg-1}"
    val regStr = "$" + s"r$reg"

    funcName match {
      case "unsafePrintChar" => load(regStr, prevRegStr, 1) + print_char(regStr)
      case "unsafePrintInt"  => load(regStr, prevRegStr, 1) + print_int(regStr)
      case  _                => error()
    }
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
  def alloc(reg: String, slots: Int)                = s"alloc($reg, $slots)\n"
  def mov_int(reg: String, tag: Int)                = s"mov_int($reg, $tag)\n"
  def print_char(reg: String)                       = s"print_char($reg)\n"
  def print_int(reg: String)                        = s"print($reg)\n"
  def mov_reg(reg1: String, reg2: String)           = s"mov_reg($reg1, $reg2)\n"
  def store(reg1: String, index: Int, reg2: String) = s"store($reg1, $index, $reg2)\n"
  def load(reg1: String, reg2: String, index: Int)  = s"load($reg1, $reg2, $index)\n"
  def mov_label(reg: String, label: String)         = s"mov_label($reg, $label)\n"
  def ret()                                         = s"return()\n"
  def call(label: String)                           = s"call($label)\n"
  def icall(reg: String)                            = s"icall($reg)\n"
  def jump(label: String)                           = s"jump($label)\n"

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  def error(msg: String = "") = throw new FlechaCompileError(msg)
}

class FlechaCompileError(val msg: String) extends Exception(s"Compile error: $msg")
