-- HC6T5.hs : Reverse a list recursively
-- This file contains a function to reverse a list using recursion.

-- Pure function: Reverses a list recursively.
reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

main :: IO ()
main = do
    putStrLn ("reverseList [1,2,3,4]: " ++ show (reverseList [1,2,3,4]))
    putStrLn ("reverseList []: " ++ show ([] :: [Int]))
