# Haskell Chapter 13 Summary: Modules

## Introduction
Modules collect related functions, types, and type classes to organize and reuse code effectively.

## Importing Modules
- Use `import` to gain access to a module's functions and types.
- Selective imports allow importing only needed functions, e.g., `import Data.List (sort, filter)`.
- Qualified imports avoid name clashes by requiring the module prefix when using functions, e.g., `import qualified Data.Map as Map`.

## Controlling Namespaces
- Name conflicts happen if different modules export functions with the same name.
- Use qualified imports and renaming (`as`) to prevent conflicts.
- You can hide specific functions during import to avoid clashes.

## Creating Your Own Modules
- Define your module with `module Name where`.
- Export lists control what is visible to users of the module.
- Hide helper functions by not exporting them.
- Export data types with or without constructors to control pattern matching.

## Prelude and Standard Libraries
- Prelude is imported by default and contains common functions like `head`, `sum`, and `length`.
- Many other standard libraries are available and can be imported as needed.
- Use tools like Hoogle to search functions in libraries.

## Practical Tasks Overview
- HC13T1: List files in the current directory using `System.Directory`.
- HC13T2: Filter files by substring using `Data.List.isInfixOf`.
- HC13T3: Sort and return filtered files using `Data.List.sort`.
- HC13T4: Create custom module `SumNonEmpty` that errors on empty list sums.
- HC13T5: Restrict module exports to hide internal helpers.
- HC13T6: Convert filtered file names to a key-value map using `Data.Map`.
- HC13T7: Use custom module functions by importing them.
- HC13T8: Handle name conflicts with qualified imports.
- HC13T9: Rename module namespaces for easier code reading.
- HC13T10: Import and call functions from multiple modules in `main`.
