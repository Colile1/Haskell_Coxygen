-- HC19T8.hs : Discard Second
-- This file implements a function using the <* operator to discard the second result.

import Control.Applicative

-- Pure function: sequences two actions but returns the result of the first.
discardSecond :: Applicative f => f a -> f b -> f a
discardSecond fa fb = fa <* fb

-- Output logic: Main entry point
main :: IO ()
main = do
    putStrLn "Running actions..."
    let action1 = putStrLn "First Action" >> return 100
    let action2 = putStrLn "Second Action (Discarded)" >> return 200
    result <- discardSecond action1 action2
    putStrLn ("Result kept: " ++ show result)
