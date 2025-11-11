-- HC17T8: foldWithSemigroup Function
-- This file demonstrates foldWithSemigroup function.

-- Pure function: Folds list using Semigroup.
foldWithSemigroup :: Semigroup a => [a] -> a
foldWithSemigroup [] = error "Empty list"
foldWithSemigroup (x:xs) = foldr (<>) x xs

-- Input wrapper: Gets list of integers and folds.
get_foldWithSemigroup :: IO Int
get_foldWithSemigroup = do
  putStrLn "Enter list of integers (space separated):"
  nums <- map read . words <$> getLine
  return (foldWithSemigroup nums)

main :: IO ()
main = do
  result <- get_foldWithSemigroup
  putStrLn ("Folded result: " ++ show result)
