-- HC19T3.hs : Safe Product Maybe
-- This file calculates the product of a list of Maybe Int values, returning Nothing if any are Nothing.

import Control.Applicative

-- Pure function: Multiplies two integers
multiply :: Int -> Int -> Int
multiply = (*)

-- Pure function: Calculates product of a list of Maybe Ints
-- Uses foldr with liftA2 to process the list safely.
safeProduct :: [Maybe Int] -> Maybe Int
safeProduct = foldr (liftA2 multiply) (Just 1)

-- Input wrapper: Creates a list of Maybe Ints
get_list :: IO [Maybe Int]
get_list = do
    return [Just 2, Just 3, Just 4]

-- Output logic
main :: IO ()
main = do
    lst <- get_list
    let result = safeProduct lst
    putStrLn ("Product Result: " ++ show result)
