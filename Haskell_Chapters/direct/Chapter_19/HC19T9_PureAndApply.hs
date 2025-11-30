-- HC19T9.hs : Pure and Apply
-- This file demonstrates how pure works with applicative effects.

import Control.Applicative

-- Pure function: Applies a pure function to a pure value inside a context
pureAndApply :: (Applicative f) => (a -> b) -> a -> f b
pureAndApply f x = pure f <*> pure x

-- Output logic
main :: IO ()
main = do
    let result :: Maybe Int
        result = pureAndApply (*2) 50
    putStrLn ("Result: " ++ show result)
