-- HC12T10.hs : Main module demonstrating mathematical operations usage.
-- This file imports MathOps module and demonstrates its functions.

module Main where

import MathOps

-- Output logic: print results of mathematical operations.
main :: IO ()
main = do
    let a = 10
        b = 5
    putStrLn ("Addition of " ++ show a ++ " and " ++ show b ++ " = " ++ show (add a b))
    putStrLn ("Subtraction of " ++ show b ++ " from " ++ show a ++ " = " ++ show (subtractNums a b))
    putStrLn ("Multiplication of " ++ show a ++ " and " ++ show b ++ " = " ++ show (multiply a b))
