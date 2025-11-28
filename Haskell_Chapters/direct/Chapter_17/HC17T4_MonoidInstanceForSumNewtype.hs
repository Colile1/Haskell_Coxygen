-- HC17T4: Monoid Instance for Sum Newtype
-- This file demonstrates Monoid instance for Sum newtype.

newtype Sum a = Sum a deriving (Show, Eq)

instance Num a => Semigroup (Sum a) where
  (<>) (Sum a) (Sum b) = Sum (a + b)

instance Num a => Monoid (Sum a) where
  mempty = Sum 0

-- Pure function: Sums a list of Sum values.
sumList :: Num a => [Sum a] -> Sum a
sumList = mconcat

-- Input wrapper: Gets list of numbers and sums them.
get_sumList :: IO (Sum Int)
get_sumList = do
  putStrLn "Enter number of values to sum:"
  n <- readLn
  values <- sequence (replicate n (putStrLn "Enter a number:" >> readLn))
  return (sumList (map Sum values))

main :: IO ()
main = do
  result <- get_sumList
  putStrLn ("Sum: " ++ show result)
