-- HC13T3_SortFilteredFiles.hs : Sort and return filtered file names
-- This file demonstrates sorting filtered files by substring.

module Main where

import System.Directory (listDirectory)
import Data.List (isInfixOf, sort)

-- Pure function: filter and sort files containing substring str
sortFilteredFiles :: String -> IO [FilePath]
sortFilteredFiles str = do
  files <- listDirectory "."
  return (sort $ filter (str `isInfixOf`) files)

-- Output logic: prints sorted filtered files for substring "hs"
main :: IO ()
main = do
  sortedFiltered <- sortFilteredFiles "hs"
  putStrLn "Sorted and filtered files containing \"hs\":"
  mapM_ putStrLn sortedFiltered
