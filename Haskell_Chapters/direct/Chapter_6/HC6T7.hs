-- HC6T7.hs : List length
-- This file contains a function to compute the length of a list.

-- Pure function: Computes the length of a list recursively.
listLength :: [a] -> Int
listLength [] = 0
listLength (_:xs) = 1 + listLength xs

main :: IO ()
main = do
    putStrLn ("listLength [1,2,3,4]: " ++ show (listLength [1,2,3,4]))
    putStrLn ("listLength []: " ++ show (listLength []))
