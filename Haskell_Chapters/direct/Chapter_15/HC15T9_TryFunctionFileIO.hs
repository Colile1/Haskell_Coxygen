-- HC15T9_TryFunctionFileIO.hs : Use try function to catch file IO exceptions
-- This file demonstrates using the try function to catch and handle file IO exceptions gracefully.

import Control.Exception (try, IOException)
import System.IO (readFile)

-- Pure function: No pure function needed for IO try example

-- Input wrapper: Attempts to read a file and catches IO exceptions using try.
tryReadFile :: FilePath -> IO (Either IOException String)
tryReadFile filePath = try (readFile filePath)

-- Output logic: Displays file content or error.
printFileContent :: Either IOException String -> IO ()
printFileContent (Left e) = putStrLn ("File read error: " ++ show e)
printFileContent (Right content) = putStrLn ("File content:\n" ++ content)

-- Input wrapper: Prompts user for file path and reads file using tryReadFile.
get_tryReadFile :: IO ()
get_tryReadFile = do
  putStrLn "Enter file path to read:"
  filePath <- getLine
  contentResult <- tryReadFile filePath
  printFileContent contentResult

-- Main function: Minimal logic.
main :: IO ()
main = get_tryReadFile
