-- HC11T8.hs : Even or Odd Checker
-- This file reads a number and tells if it's even or odd.

-- Pure function: Checks if even or odd.
checkEvenOdd :: Int -> String
checkEvenOdd n = if even n then "Even" else "Odd"

-- Input wrapper: Gets number and returns result.
get_checkEvenOdd :: IO String
get_checkEvenOdd = do
    putStrLn "Enter a number:"
    input <- getLine
    let num = read input :: Int
    return (checkEvenOdd num)

main :: IO ()
main = do
    result <- get_checkEvenOdd
    putStrLn ("The number is: " ++ result)
