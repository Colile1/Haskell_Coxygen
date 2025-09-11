-- HC1T1 - Task 1: Function Composition
-- This code defines functions for doubling and incrementing numbers, then composes them to apply double first and then increment.

double :: Int -> Int  -- Type signature for double: takes Int, returns Int
double x = 2 * x  -- Multiplies the input x by 2; alternative: use (*) 2 x or x * 2

increment :: Int -> Int  -- Type signature for increment: takes Int, returns Int
increment x = x + 1  -- Adds 1 to the input x; alternative: use succ x if assuming positive

doubleThenIncrement :: Int -> Int  -- Type signature for composed function
doubleThenIncrement = increment . double  -- Composes increment after double using (.) operator; alternative: define as \x -> increment (double x)

main :: IO ()  -- Main IO action for testing the function
main = print (doubleThenIncrement 5)  -- Prints the result of applying doubleThenIncrement to 5; expected output: 11
