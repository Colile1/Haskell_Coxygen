-- HC11T3.hs : Double a Number
-- This file asks for a number and prints it doubled.

-- Pure function: Doubles a number.
doubleNum :: Int -> Int
doubleNum n = n * 2

-- Input wrapper: Gets the number and returns doubled.
get_doubleNum :: IO Int
get_doubleNum = do
    putStrLn "Enter a number:"
    input <- getLine
    let num = read input :: Int
    return (doubleNum num)

main :: IO ()
main = do
    doubled <- get_doubleNum
    putStrLn ("Doubled: " ++ show doubled)
