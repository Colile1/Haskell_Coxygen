-- HC17T5: combineLists Function
-- This file demonstrates combining lists using Semigroup.

-- Pure function: Combines two lists.
combineLists :: [Int] -> [Int] -> [Int]
combineLists a b = a <> b

-- Input wrapper: Gets two lists and combines them.
get_combineLists :: IO [Int]
get_combineLists = do
  putStrLn "Enter first list (space separated):"
  a <- map read . words <$> getLine
  putStrLn "Enter second list (space separated):"
  b <- map read . words <$> getLine
  return (combineLists a b)

main :: IO ()
main = do
  result <- get_combineLists
  putStrLn ("Combined list: " ++ show result)
