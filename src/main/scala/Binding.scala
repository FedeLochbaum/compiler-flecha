trait Binding {}

case class BRegister(value: String) extends Binding

case class BEnclosed(value: Int) extends Binding