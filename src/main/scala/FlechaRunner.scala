import java.io.{BufferedWriter, File, FileWriter}

import scala.language.postfixOps
import sys.process._

object FlechaRunner {
  def run(flechaProgram: String) :String = {
    val mamarrachoProgram = FlechaCompiler(FlechaParser(flechaProgram).ast).compile
    val file = new File(s"src/utils/mamarrachoProgram.m")
    val bw = new BufferedWriter(new FileWriter(file))
    bw.write(mamarrachoProgram)
    bw.close()
    ("src/utils/./mamarracho.exe src/utils/mamarrachoProgram.m" !!).replaceAll("\\s+$", "")
  }

}
