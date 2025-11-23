-- HC13_SummaryModules.hs : Summary notes for chapter 13 on Haskell Modules
-- This file contains a concise summary of modules concepts and practical tasks in chapter 13.

-- Introduction: What are modules and why use them
-- Pure function: returns a string summary of the chapter introduction
summaryIntroduction :: String
summaryIntroduction = "Modules collect related functions, types, and classes for code reuse and organization."

-- Importing Modules: selective and qualified imports explained
summaryImporting :: String
summaryImporting = "Import modules to use their functions. Selective imports bring in only needed functions. Qualified imports avoid name clashes by requiring module prefix."

-- Controlling namespaces: avoiding conflicts by qualifying and renaming
summaryNamespaces :: String
summaryNamespaces = "Namespace controls prevent name clashes. Use qualified imports and 'as' to rename namespaces."

-- Creating your own modules: defining, export lists, and hiding internals
summaryCreatingModules :: String
summaryCreatingModules = "Define your own modules with 'module Name where'. Control exports to hide internals using export lists."

-- Prelude and standard libraries overview
summaryPrelude :: String
summaryPrelude = "Prelude module is imported by default with common functions. Many other standard libraries are available for import."

-- Overview of Practical Tasks in chapter 13
summaryPracticalTasks :: String
summaryPracticalTasks = unlines
  [ "HC13T1: List files using System.Directory."
  , "HC13T2: Filter files by substring using Data.List.isInfixOf."
  , "HC13T3: Sort filtered files using Data.List.sort."
  , "HC13T4: Create SumNonEmpty module to handle empty list sum with error."
  , "HC13T5: Restrict module exports to hide helpers."
  , "HC13T6: Use Data.Map to convert file names to key-value map."
  , "HC13T7: Import and use custom module functions."
  , "HC13T8: Use qualified imports to handle name conflicts."
  , "HC13T9: Rename module namespaces for clarity."
  , "HC13T10: Combine multiple modules in main function."
  ]

-- main function prints the summary notes parts
main :: IO ()
main = do
  putStrLn "Chapter 13 Summary Notes - Modules"
  putStrLn ""
  putStrLn summaryIntroduction
  putStrLn ""
  putStrLn summaryImporting
  putStrLn ""
  putStrLn summaryNamespaces
  putStrLn ""
  putStrLn summaryCreatingModules
  putStrLn ""
  putStrLn summaryPrelude
  putStrLn ""
  putStrLn "Practical Tasks Overview:"
  putStrLn summaryPracticalTasks
