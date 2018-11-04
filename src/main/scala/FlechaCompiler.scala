import ast._

case class FlechaCompiler(AST: AST) {

  type MamarrachoProgram = String

  val temp = "$" + "t"

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
  var count = 0
  var nextTag = 7

  def newReg = { count = count + 1 ; count }
  def newTag = { nextTag = nextTag + 1 ; nextTag }

  def restartState = {
    count = 0
    nextTag = 7
    tagMap = initialTagMap
    initialEnv
  }

  def initialEnv ={
    AST match {
      case ProgramAST(defs) => defs.foreach(ast => intialRegister(ast))
      case _                 => error()
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

  ///////////////////////////////////// FINISH COMPILER STATE FUNCTIONALITY //////////////////////////////////////


  def compile : MamarrachoProgram = {
    restartState
    AST match {
      case ProgramAST(defs) => defs.reverse.map(ast => compileAst(ast, newReg)).mkString
      case _                 => error()
    }
  }

  def compileAst(ast: AST, reg: Int) :String = {
    ast match {
      case DefAST(name, expr)                               => compileDef(name, expr, reg)
      case CharAST(value)                                   => compileChar(value, reg)
      case NumberAST(value)                                 => compileInt(value, reg)
      case AppExprAST(atomicOp, appExprAST)                 => compileApplication(atomicOp, appExprAST, reg)
      case LowerIdAST(value)                                => compileVariable(value, reg)
      case UpperIdAST(value)                                => ""
      case CaseBranchAST(constructor, params, internalExpr) => ""
      case CaseAST(internalExpr, caseBranchs)               => ""
      case LetAST(name, internalExpr, externalExp)          => ""
      case LambdaAST(id, externalExp)                       => ""
      case UnaryWithParenAST(expr)                          => ""
      case _                                                => error()
    }
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
        case BEnclosed(reg2)     => mov_reg(regStr, defRegName)
        case BRegister(register) => ""
        case _                   => ""
      }
    } else ""
  }

  def compileApplication(atomicOp: AST, appExprAST: AST, reg: Int) :String = {
    val compiledExp = compileAst(appExprAST, reg)
    atomicOp match {
      case LowerIdAST(value)                => compiledExp + compileLowerIdApp(value, reg+1)
      case UpperIdAST(value)                => compiledExp + ""
      case AppExprAST(atomic, expr)         => compiledExp + compileApplication(atomic, expr, reg+1)
      case _                                => error()
    }
  }

  def compileLowerIdApp(funcName: String, reg: Int) = {
    val prevRegStr = "$" + s"r${reg-1}"
    val regStr = "$" + s"r$reg"

    funcName match {
      case "unsafePrintChar" => load(regStr, prevRegStr, 1) + print_char(regStr)
      case "unsafePrintInt"  => load(regStr, prevRegStr, 1) + print_int(regStr)
      case  _                => error() // TODO: Update it
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
  def alloc(reg: String, slots: Int)                = s"alloc($reg, $slots) "
  def mov_int(reg: String, tag: Int)                = s"mov_int($reg, $tag) "
  def print_char(reg: String)                       = s"print_char($reg) "
  def print_int(reg: String)                        = s"print($reg) "
  def mov_reg(reg1: String, reg2: String)           = s"mov_reg($reg1, $reg2) "
  def store(reg1: String, index: Int, reg2: String) = s"store($reg1, $index, $reg2) "
  def load(reg1: String, reg2: String, index: Int)  = s"load($reg1, $reg2, $index) "

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  def error(msg: String = "") = throw new FlechaCompileError(msg)
}

class FlechaCompileError(val msg: String) extends Exception(s"Compile error: $msg")
