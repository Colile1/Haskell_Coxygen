-- HC19T2.hs : Add Three Applicative
-- This file implements a function to add three Maybe Int values using applicative style.

import Control.Applicative

-- Pure function: Adds three integers
addThree :: Int -> Int -> Int -> Int
addThree n1 n2 n3 = n1 + n2 + n3

-- Pure function: Adds three Maybe Int values using Applicative style
addThreeApplicative :: Maybe Int -> Maybe Int -> Maybe Int -> Maybe Int
addThreeApplicative m1 m2 m3 = pure addThree <*> m1 <*> m2 <*> m3

-- Input wrapper: gets a hardcoded Maybe Int for demonstration
get_inputs :: IO (Maybe Int, Maybe Int, Maybe Int)
get_inputs = do
    return (Just 5, Just 10, Just 20)

-- Output logic
main :: IO ()
main = do
    (n1, n2, n3) <- get_inputs
    let result = addThreeApplicative n1 n2 n3
    putStrLn ("Result Sum: " ++ show result)

