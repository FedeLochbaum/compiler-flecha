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
        env = env.+((name, BRegister("$" + s"G_$name")))
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
      case ProgramAST(defs) => defs.flatMap(ast => compileAst(ast)).toString()
      case _                 => error()
    }
  }

  def compileAst(ast: AST)  = {
    ast match {
      case DefAST(name, expr) => ""
      case CharAST(value) => compileChar(value)
      case NumberAST(value) => ""
      case LowerIdAST(value) => ""
      case UpperIdAST(value) => ""
      case CaseBranchAST(constructor, params, internalExpr) => ""
      case CaseAST(internalExpr, caseBranchs) => ""
      case LetAST(name, internalExpr, externalExp) => ""
      case LambdaAST(id, externalExp) => ""
      case UnaryWithParenAST(expr) => ""
      case AppExprAST(atomicOp, appExprAST) => ""
      case _                                => error()
    }
  }

  def compileChar(char: Char) = {
    val reg = newReg
    val regStr = "$" + s"r$reg"

    s"alloc($regStr, 2) " +
    s"mov_int($temp, ${getTag("Char")}) " +
    s"store($regStr, 0, $temp) " +
    s"mov_int($temp, ${char.toByte}) " +
    s"store($regStr, 1, $temp) "
  }

  def error(msg: String = "") = throw new FlechaCompileError(msg)
}

class FlechaCompileError(val msg: String) extends Exception(s"Compile error: $msg")
