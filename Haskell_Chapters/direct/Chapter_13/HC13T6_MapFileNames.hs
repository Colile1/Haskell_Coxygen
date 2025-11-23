-- HC13T6_MapFileNames.hs : Convert filtered file names into a key-value map using Data.Map

import System.Directory (listDirectory)
import Data.List (isInfixOf, sort)
import qualified Data.Map as Map

-- Pure function: create Map from filtered and sorted file names
mapFileNames :: String -> IO (Map.Map Int String)
mapFileNames str = do
  files <- listDirectory "."
  let filteredSorted = sort $ filter (str `isInfixOf`) files
  let mapped = Map.fromList $ zip ([1..] :: [Int]) filteredSorted
  return mapped

-- Output logic: print map entries for substring "hs"
main :: IO ()
main = do
  fileMap <- mapFileNames "hs"
  putStrLn "Mapped file names with keys:"
  mapM_ print (Map.toList fileMap)
