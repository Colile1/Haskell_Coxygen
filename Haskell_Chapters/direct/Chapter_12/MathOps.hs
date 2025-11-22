-- MathOps.hs : Mathematical Operations Module
-- This file defines a module with basic mathematical operations.

module MathOps (
    add,
    subtractNums,
    multiply
) where

-- Pure function: adds two numbers.
add :: Num a => a -> a -> a
add x y = x + y

-- Pure function: subtracts second number from first.
subtractNums :: Num a => a -> a -> a
subtractNums x y = x - y

-- Pure function: multiplies two numbers.
multiply :: Num a => a -> a -> a
multiply x y = x * y
