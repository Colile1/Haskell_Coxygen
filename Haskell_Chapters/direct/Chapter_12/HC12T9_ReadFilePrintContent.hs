-- HC12T9.hs : Read and Print File Content
-- This file contains a program to read a file and print its contents with error handling.

import System.IO (readFile, hPutStrLn, stderr)
import System.Directory (doesFileExist)

-- Pure function: attempts to read the content of a file safely.
readFileSafe :: FilePath -> IO (Either String String)
readFileSafe fileName = do
    exists <- doesFileExist fileName
    if exists 
      then Right <$> readFile fileName
      else return (Left "Error: File does not exist.")

-- Input wrapper: gets filename input from user and reads the file content.
get_readFileSafe :: IO (Either String String)
get_readFileSafe = do
    putStrLn "Enter the file name to read:"
    fileName <- getLine
    readFileSafe fileName

-- Output logic: prints the file content or error message.
printResult :: Either String String -> IO ()
printResult (Right content) = putStrLn ("File content:\n" ++ content)
printResult (Left errMsg) = hPutStrLn stderr errMsg

main :: IO ()
main = do
    result <- get_readFileSafe
    printResult result
