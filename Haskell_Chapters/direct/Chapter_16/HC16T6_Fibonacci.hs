-- HC16T6: nth Fibonacci Number
-- Implement a function that returns the nth Fibonacci number.

fibonacci :: Int -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

main :: IO ()
main = do
    putStrLn "Enter n to get the nth Fibonacci number:"
    input <- getLine
    let n = read input :: Int
    putStrLn $ "Fibonacci(" ++ show n ++ ") = " ++ show (fibonacci n)
