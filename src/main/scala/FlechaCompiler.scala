import ast._

case class FlechaCompiler(AST: AST) {

  type MamarrachoProgram = String

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

  var count = 0
  var nextTag = 7

  def newReg = { count = count + 1 ; count }
  def newTag = { nextTag = nextTag + 1 ; nextTag }

  def compile : MamarrachoProgram = {
    restartState
    AST match {
      case ProgramAST(defs) => defs.flatMap(ast => compileAst(ast)).toString()
      case _                 => error()
    }
  }

  def restartState = {
    count = 0
    nextTag = 7
    tagMap = initialTagMap
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

  def compileAst(ast: AST)  = {
    ast match {
      case NumberAST(value) => ""
      case LowerIdAST(value) => ""
      case UpperIdAST(value) => ""
      case CharAST(value) => ""
      case DefAST(name, expr) => ""
      case CaseBranchAST(constructor, params, internalExpr) => ""
      case CaseAST(internalExpr, caseBranchs) => ""
      case LetAST(name, internalExpr, externalExp) => ""
      case LambdaAST(id, externalExp) => ""
      case UnaryWithParenAST(expr) => ""
      case AppExprAST(atomicOp, appExprAST) => ""
      case _                                => error()
    }
  }

  def error(msg: String = "") = throw new FlechaCompileError(msg)
}

class FlechaCompileError(val msg: String) extends Exception(s"Compile error: $msg")
