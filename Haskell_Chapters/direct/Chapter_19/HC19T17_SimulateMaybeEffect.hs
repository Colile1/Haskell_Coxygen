-- HC19T17.hs : Simulate Maybe Effect
-- This file applies a function to multiple Maybe values using applicative style (traverse).

import Control.Applicative

-- Pure function: Doubling function
double :: Int -> Int
double = (*2)

-- Pure function: Traverses a list of Maybes applying the function
simulateMaybeEffect :: [Int] -> Maybe [Int]
simulateMaybeEffect values = traverse (pure . double) values

-- Output logic
main :: IO ()
main = do
    let inputs = [1, 2, 3]
    let result = simulateMaybeEffect inputs
    putStrLn ("Traversed Result: " ++ show result)
