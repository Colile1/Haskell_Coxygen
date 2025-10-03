-- HC6T2.hs : Fibonacci recursive
-- This file contains a recursive function to compute Fibonacci.

-- Pure function: Computes nth Fibonacci number recursively.
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = do
    putStrLn ("fib 5: " ++ show (fib 5))
    putStrLn ("fib 0: " ++ show (fib 0))
