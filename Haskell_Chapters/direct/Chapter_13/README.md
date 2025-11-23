# Haskell Chapter 13: Modules

# Haskell Chapter 13 Practical Tasks: Working with Modules and Directories


## HC13T1: List Files in Directory
Create a program that lists all files in the current directory using the System.Directory module.

## HC13T2: Filter Files by Substring
Write a function that filters files in the current directory based on a substring in the filename using Data.List.isInfixOf.

## HC13T3: Sort and Return Filtered Files
Implement a function that sorts and returns filtered file names from the current directory using both Data.List.sort and Data.List.filter.

## HC13T4: SumNonEmpty Module
Write a Haskell module named SumNonEmpty that defines a function sumNonEmpty, which returns an error if called on an empty list.

## HC13T5: Restrict Module Export List
Refactor the sumNonEmpty function to restrict the visibility of helper functions like error messages in the module export list.

## HC13T6: File Names to Map
Create a function that uses Data.Map to convert a list of filtered file names into a key-value map.

## HC13T7: Use Custom Module in Main
Write a program that imports a function from your custom SumNonEmpty module and calculates the sum of a list of numbers.

## HC13T8: Qualified Imports for Name Conflicts
Demonstrate how to handle name conflicts between two imported modules, using qualified imports.

## HC13T9: Renaming Module Namespace
Create a function that demonstrates renaming a module namespace and uses functions from both renamed modules.

## HC13T10: Multi-Module Main Function
Create a main function that imports and calls functions from at least two modules (System.Directory, Data.List) to perform a search and display sorted file results.

