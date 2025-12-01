-- HC20T3.hs : Writer Logging Calculator
-- This file uses the Writer monad to log operations during a calculation.

import Control.Monad.Writer

-- Pure function: Adds two numbers and logs the operation
logAdd :: Int -> Int -> Writer [String] Int
logAdd x y = do
    tell ["Added " ++ show x ++ " and " ++ show y]
    return (x + y)

-- Pure function: Multiplies two numbers and logs the operation
logMult :: Int -> Int -> Writer [String] Int
logMult x y = do
    tell ["Multiplied " ++ show x ++ " by " ++ show y]
    return (x * y)

-- Pure function: Chains operations
calculate :: Writer [String] Int
calculate = do
    a <- logAdd 10 20
    b <- logMult a 2
    return b

-- Output logic: 
main :: IO ()
main = do
    let (result, logs) = runWriter calculate
    putStrLn ("Result: " ++ show result)
    putStrLn "Logs:"
    mapM_ putStrLn logs
