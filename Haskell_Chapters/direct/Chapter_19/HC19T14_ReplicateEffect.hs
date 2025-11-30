-- HC19T14.hs : Replicate Effect
-- This file replicates a given IO action a specified number of times using replicateM.

import Control.Monad (replicateM)

-- Pure function: Wraps replicateM
replicateEffect :: Int -> IO a -> IO [a]
replicateEffect = replicateM

-- Input wrapper: Simulates an action
get_action :: IO String
get_action = do
    return "Echo"

-- Output logic
main :: IO ()
main = do
    results <- replicateEffect 3 get_action
    putStrLn ("Replicated Result: " ++ show results)
