-- HC13T2_FilterFiles.hs : Filter files by substring in current directory using Data.List.isInfixOf
-- This file demonstrates filtering file names containing a given substring.

import System.Directory (listDirectory)
import Data.List (isInfixOf)

-- Pure function: filter files containing the substring str
filterFiles :: String -> IO [FilePath]
filterFiles str = do
  files <- listDirectory "."
  return (filter (str `isInfixOf`) files)

-- Output logic: prints the filtered files for substring "hs"
main :: IO ()
main = do
  filtered <- filterFiles "hs"
  putStrLn "Filtered files containing \"hs\":"
  mapM_ putStrLn filtered
