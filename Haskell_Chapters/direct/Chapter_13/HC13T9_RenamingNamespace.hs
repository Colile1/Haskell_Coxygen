-- HC13T9_RenamingNamespace.hs : Demonstration of renaming module namespaces

import qualified Data.List as List
import qualified Data.Map as Map
import System.Directory (listDirectory)

-- Pure function: creates map from filtered list using renamed imports
renamedNamespaceExample :: String -> IO (Map.Map Int String)
renamedNamespaceExample str = do
  dirFiles <- listDirectory "."
  let filtered = List.filter (List.isInfixOf str) dirFiles
  let sortedFiles = List.sort filtered
  let mapped = Map.fromList $ zip [1..] sortedFiles
  return mapped

-- Output logic: print map of filtered files using renamed namespaces
main :: IO ()
main = do
  fileMap <- renamedNamespaceExample "hs"
  print (Map.toList fileMap)
