-- HC13T1_ListFiles.hs : List files in current directory using System.Directory
-- This file demonstrates listing all files in current directory.

import System.Directory (listDirectory)

-- Pure function: list all files in directory "."
listFiles :: IO [FilePath]
listFiles = listDirectory "."

-- Output logic: print the list of files
main :: IO ()
main = do
  files <- listFiles
  putStrLn "Files in current directory:"
  mapM_ putStrLn files
