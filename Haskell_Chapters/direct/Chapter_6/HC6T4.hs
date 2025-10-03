-- HC6T4.hs : Product of elements using foldl
-- This file contains a function to compute the product of elements in a list using foldl.

-- Pure function: Computes product of list elements using foldl.
productFoldl :: [Int] -> Int
productFoldl = foldl (*) 1

main :: IO ()
main = do
    putStrLn ("productFoldl [1,2,3,4]: " ++ show (productFoldl [1,2,3,4]))
    putStrLn ("productFoldl []: " ++ show (productFoldl []))
