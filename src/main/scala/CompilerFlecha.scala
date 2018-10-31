import ast._

case class CompilerFlecha(AST: AST) {

  type MamarrachoProgram = String

  def compile : MamarrachoProgram = {
    restartState
    AST match {
      case ProgramAST(exprs) => exprs.flatMap(ast => compileAst(ast)).toString()
      case _                 => error()
    }
  }

  def restartState = ""

  def compileAst(ast: AST) : MamarrachoProgram = {
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
    }
  }

  def error(msg: String = "") = throw new FlechaCompileError(msg)
}

class FlechaCompileError(val msg: String) extends Exception(s"Compile error: $msg")
