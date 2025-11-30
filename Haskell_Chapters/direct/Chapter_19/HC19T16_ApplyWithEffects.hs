-- HC19T16.hs : Apply With Effects
-- This file implements applyWithEffects to show how the <*> operator sequences two effects.

import Control.Applicative

-- Pure function: String concatenation
concatStr :: String -> String -> String
concatStr x y = x ++ y

-- Pure function: Sequences effects
applyWithEffects :: IO String -> IO String -> IO String
applyWithEffects io1 io2 = pure concatStr <*> io1 <*> io2

-- Output logic
main :: IO ()
main = do
    let io1 = putStr "Hello " >> return "Hello "
    let io2 = putStr "Johannesburg" >> return "Johannesburg"
    putStrLn "\n--- Executing ---"
    res <- applyWithEffects io1 io2
    putStrLn ("\nFinal Return: " ++ res)
