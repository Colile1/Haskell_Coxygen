-- HC11T9.hs : Sum Two Numbers
-- This file reads two numbers and prints their sum.

-- Pure function: Sums two numbers.
sumTwo :: Int -> Int -> Int
sumTwo a b = a + b

-- Input wrapper: Gets two numbers and returns sum.
get_sumTwo :: IO Int
get_sumTwo = do
    putStrLn "Enter first number:"
    input1 <- getLine
    let num1 = read input1 :: Int
    putStrLn "Enter second number:"
    input2 <- getLine
    let num2 = read input2 :: Int
    return (sumTwo num1 num2)

main :: IO ()
main = do
    sum <- get_sumTwo
    putStrLn ("Sum: " ++ show sum)
