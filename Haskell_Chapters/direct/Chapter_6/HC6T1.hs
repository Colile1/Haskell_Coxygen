-- HC6T1.hs : Factorial recursive
-- This file contains a recursive function to compute factorial.

-- Pure function: Computes factorial recursively.
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    putStrLn ("factorial 5: " ++ show (factorial 5))
    putStrLn ("factorial 0: " ++ show (factorial 0))
