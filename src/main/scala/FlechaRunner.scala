import java.io.{BufferedWriter, File, FileWriter}

import scala.io.Source
import scala.language.postfixOps
import sys.process._

object FlechaRunner {
  def run(flechaProgram: String) :String = {
    val mamarrachoProgram = FlechaCompiler(FlechaParser(flechaProgram.replace("\r", "")).ast).compile
    val file = new File(s"src/utils/mamarrachoProgram.m")
    val bw = new BufferedWriter(new FileWriter(file))
    bw.write(mamarrachoProgram)
    bw.close()
    ("src/utils/./mamarracho.exe src/utils/mamarrachoProgram.m" !!).replaceAll("\\s+$", "").replace("\n", "").replace("\r", "")
  }

  def compile(fileName: String) = {
    val input = Source.fromFile(fileName).mkString
    val mamarrachoProgram = FlechaCompiler(FlechaParser(input.replace("\r", "")).ast).compile
    val file = new File(s"$fileName.mamarracho")
    val bw = new BufferedWriter(new FileWriter(file))
    bw.write(mamarrachoProgram)
    bw.close()
    mamarrachoProgram
  }
}
