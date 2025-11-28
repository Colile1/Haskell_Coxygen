# cabal a file management system 

	HC14-14. Haskell Chapter 14 Practical Tasks: Cabal_and_language_extensions	This lesson introduces Cabal and Language Extensions, essential tools for managing Haskell projects and extending the language’s capabilities. It begins with an introduction to Cabal, Haskell’s build system and package manager, explaining how it simplifies dependency management and project organization. Learners will then create a new Haskell project, exploring the Cabal file, which defines project metadata, dependencies, and configurations. Using an external library, the lesson demonstrates how to integrate third-party functionality. The process of building and running the executable is covered, ensuring a smooth workflow for Haskell development. The lesson then shifts to language extensions and pragmas, which unlock advanced Haskell features beyond the standard language definition. Two specific extensions are highlighted: NumericUnderscores, which improves number readability, and TypeApplications, which allows explicit type specification for polymorphic functions. As with previous topics, both video and written materials complement each other—videos provide practical demonstrations, while written content offers structured, sequential explanations. By mastering Cabal and language extensions, developers gain greater control over their projects and unlock powerful features to enhance their Haskell programming experience

# Haskell Chapter 14 Practical Tasks: Cabal Projects and Advanced Features

## HC14T1: Initialize a Cabal Project
Create a Haskell project using cabal init. Add a main executable that outputs "Hello, Cabal!".

## HC14T2: Add Dependency and Print Random Number
Modify the .cabal file to include a dependency on the random package and print a random number between 1 and 100.

## HC14T3: NumericUnderscores Extension
Enable the NumericUnderscores extension. Create variables with large numbers and print them.

## HC14T4: TypeApplications Extension
Enable the TypeApplications extension and create a function that reads a String and converts it to an Int using read.

## HC14T5: Custom Data Type and Pattern Matching with @
Write a Haskell program that uses a custom data type Result a and demonstrate pattern matching using the @ symbol.

## HC14T6: Project Structure: src and app
Create a cabal project structure with src and app directories. Place the main module in the app folder and additional modules in src.

## HC14T7: Library Component in Cabal
Modify the .cabal file to support a library component alongside the main executable.

## HC14T8: Character Frequency Function
Implement a function counts that returns a list of tuples showing character frequency in a string.

## HC14T9: PartialTypeSignatures Extension
Use the language extension PartialTypeSignatures to allow wildcard types in a function signature.

## HC14T10: Cabal Test Suite
Write a cabal test suite for a module that verifies correct behavior of the counts function.