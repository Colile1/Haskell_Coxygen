-- HC20T19.hs : Writer Logging System
-- This file tracks function calls using a Writer monad.

import Control.Monad.Writer

-- Pure function: A computation step that logs itself
processStep :: String -> Int -> Writer [String] Int
processStep name value = do
    tell ["Called " ++ name ++ " with value " ++ show value]
    return (value * 2)

-- Pure function: Chains steps
system :: Writer [String] Int
system = do
    v1 <- processStep "Load" 10
    v2 <- processStep "Transform" v1
    return v2

-- Output logic: 
main :: IO ()
main = do
    let (res, logs) = runWriter system
    putStrLn ("Final Value: " ++ show res)
    putStrLn "--- System Log ---"
    mapM_ putStrLn logs
