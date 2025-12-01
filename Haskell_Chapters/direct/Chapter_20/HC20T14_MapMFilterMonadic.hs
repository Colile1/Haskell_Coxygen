-- HC20T14.hs : Map Filter Monadic
-- This file implements a monadic function that maps and filters elements.

import Control.Monad (filterM)

-- Pure function: A predicate that runs in a Monad (e.g., IO or Maybe)
-- Here we check if a number is even, wrapped in Just.
checkEven :: Int -> Maybe Bool
checkEven x = Just (even x)

-- Pure function: Uses filterM to filter a list based on monadic predicate
mapMFilter :: (Monad m) => (a -> m Bool) -> [a] -> m [a]
mapMFilter = filterM

-- Output logic: 
main :: IO ()
main = do
    let nums = [1..10]
    let result = mapMFilter checkEven nums
    putStrLn ("Filtered Evens (Monadic): " ++ show result)
