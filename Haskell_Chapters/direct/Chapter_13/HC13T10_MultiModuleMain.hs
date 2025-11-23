-- HC13T10_MultiModuleMain.hs : Main function using multiple modules to search and display sorted file results

import System.Directory (listDirectory)
import Data.List (isInfixOf, sort)

-- Pure function: get sorted list of files containing given substring
searchAndSort :: String -> IO [FilePath]
searchAndSort str = do
  files <- listDirectory "."
  return (sort $ filter (isInfixOf str) files)

-- Output logic: print results for substring "hs"
main :: IO ()
main = do
  results <- searchAndSort "hs"
  putStrLn "Filtered and sorted files containing \"hs\":"
  mapM_ putStrLn results
