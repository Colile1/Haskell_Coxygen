-- HC13T8_QualifiedImports.hs : Demonstrate handling name conflicts with qualified imports

import qualified Data.List as List
import qualified Data.Map as Map

-- Pure function: example showing filter usage from both modules
qualifiedFilterExample :: [Int] -> Map.Map Int Int
qualifiedFilterExample xs =
  let filteredList = List.filter even xs
      mapped = Map.fromList $ zip [1..] filteredList
  in mapped

-- Output logic: print map of filtered even numbers from list
main :: IO ()
main = do
  let colileList = [1..n]
      n = 6
  print (qualifiedFilterExample colileList)
