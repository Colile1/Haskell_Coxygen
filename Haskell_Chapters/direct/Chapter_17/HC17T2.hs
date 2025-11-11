-- HC17T2: Min and Max Newtypes with Semigroup
-- This file demonstrates Min and Max newtypes with Semigroup instances.

-- Pure function: Creates Min newtype.
newtype Min a = Min a deriving (Show, Eq)

-- Pure function: Creates Max newtype.
newtype Max a = Max a deriving (Show, Eq)

instance Ord a => Semigroup (Min a) where
  (<>) (Min a) (Min b) = Min (min a b)

instance Ord a => Semigroup (Max a) where
  (<>) (Max a) (Max b) = Max (max a b)

-- Input wrapper: Gets Min values and combines.
get_minCombine :: IO (Min Int)
get_minCombine = do
  putStrLn "Enter first number for Min:"
  a <- readLn
  putStrLn "Enter second number for Min:"
  b <- readLn
  return (Min a <> Min b)

-- Input wrapper: Gets Max values and combines.
get_maxCombine :: IO (Max Int)
get_maxCombine = do
  putStrLn "Enter first number for Max:"
  a <- readLn
  putStrLn "Enter second number for Max:"
  b <- readLn
  return (Max a <> Max b)

main :: IO ()
main = do
  minResult <- get_minCombine
  putStrLn ("Min result: " ++ show minResult)
  maxResult <- get_maxCombine
  putStrLn ("Max result: " ++ show maxResult)
