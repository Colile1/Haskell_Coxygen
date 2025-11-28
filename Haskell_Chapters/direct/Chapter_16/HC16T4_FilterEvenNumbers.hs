-- HC16T4: Filter Even Numbers
-- Implement a function that filters only even numbers from a list.

filterEven :: [Int] -> [Int]
filterEven = filter even

main :: IO ()
main = do
    putStrLn "Enter a list of integers separated by spaces:"
    input <- getLine
    let nums = map read (words input) :: [Int]
    let evens = filterEven nums
    putStrLn $ "Even numbers: " ++ show evens
