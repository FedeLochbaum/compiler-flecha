import org.scalatest.{FunSpec, Matchers}

import scala.io.Source

class CompilerTest  extends FunSpec with Matchers {
  describe("For each test case, check if the result of compiler is equals to output of interpreter the mamarracho program") {
    val testCases = List("01", "02", "03", "04", "05", "06", "07", "08", "09")//, "10", "11", "12",
//      "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31")

    val directionCases = "src/utils/testCases/"

    testCases.foreach( testNumber =>
      it(s"Test $testNumber") {
        val flechaProgram = Source.fromFile(s"${directionCases}test$testNumber.fl").mkString
        val expectedResult = Source.fromFile(s"${directionCases}test$testNumber.expected").getLines().mkString

        FlechaRunner.run(flechaProgram) should equal (expectedResult)
      }
    )
  }
}

