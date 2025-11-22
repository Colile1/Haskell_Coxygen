-- HC12T4: First 10 Fibonacci Numbers

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = print [fib n | n <- [0..9]]
