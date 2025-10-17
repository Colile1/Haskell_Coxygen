-- HC7T3.hs : Compare Values Function
-- This file writes a function to compare two values with Eq and Ord constraints.

-- Pure function: Compares two values and returns the larger one.
compareValues :: (Eq a, Ord a) => a -> a -> a
compareValues x y = if x > y then x else y

-- Input wrapper: Gets two integers from input.
get_compareValues :: IO Int
get_compareValues = do
    putStrLn "Enter first number:"
    x <- readLn
    putStrLn "Enter second number:"
    y <- readLn
    return (compareValues x y)

-- Output logic: Prints the larger value.
main :: IO ()
main = do
    result <- get_compareValues
    putStrLn "Larger value: "
    putStrLn (show result)
