-- HC6T8.hs : Filter even numbers
-- This file contains a function to filter even numbers from a list.

-- Pure function: Filters even numbers from a list recursively.
filterEven :: [Int] -> [Int]
filterEven [] = []
filterEven (x:xs)
  | even x = x : filterEven xs
  | otherwise = filterEven xs

main :: IO ()
main = do
    putStrLn ("filterEven [1,2,3,4,5,6]: " ++ show (filterEven [1,2,3,4,5,6]))
    putStrLn ("filterEven []: " ++ show (filterEven []))
