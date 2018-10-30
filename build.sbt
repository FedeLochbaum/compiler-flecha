name := "compiler-flecha"

version := "0.1"

scalaVersion := "2.12.7"

lazy val parserFlecha = RootProject(uri("https://gitlab.com/trimegisto/parser-flecha.git"))

lazy val root = (project in file(".")).dependsOn(parserFlecha)

libraryDependencies += "com.typesafe.play" %% "play-json" % "2.6.10"
libraryDependencies += "com.lihaoyi" %% "upickle" % "0.6.6"
libraryDependencies += "org.scalactic" %% "scalactic" % "3.0.5"
libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.5" % "test"
resolvers += "Artima Maven Repository" at "http://repo.artima.com/releases"

addSbtPlugin("com.artima.supersafe" % "sbtplugin" % "1.1.3")
