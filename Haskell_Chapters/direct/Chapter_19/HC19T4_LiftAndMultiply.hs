-- HC19T4.hs : Lift And Multiply
-- This file creates a function that lifts a binary multiplication function using liftA2.

import Control.Applicative

-- Pure function: The binary multiplication function
multiply :: Int -> Int -> Int
multiply = (*)

-- Pure function: Lifts the multiply function to the Applicative context
liftAndMultiply :: Applicative f => f Int -> f Int -> f Int
liftAndMultiply = liftA2 multiply

-- Input wrapper: Returns two Just Int values
get_maybe_values :: IO (Maybe Int, Maybe Int)
get_maybe_values = do
    return (Just 6, Just 7)

-- Output logic
main :: IO ()
main = do
    (val1, val2) <- get_maybe_values
    let result = liftAndMultiply val1 val2
    putStrLn ("Multiplication Result: " ++ show result)
