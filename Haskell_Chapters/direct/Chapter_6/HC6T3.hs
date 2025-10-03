-- HC6T3.hs : Sum of elements using foldr
-- This file contains a function to compute the sum of elements in a list using foldr.

-- Pure function: Computes sum of list elements using foldr.
sumFoldr :: [Int] -> Int
sumFoldr = foldr (+) 0

main :: IO ()
main = do
    putStrLn ("sumFoldr [1,2,3,4]: " ++ show (sumFoldr [1,2,3,4]))
    putStrLn ("sumFoldr []: " ++ show (sumFoldr []))
