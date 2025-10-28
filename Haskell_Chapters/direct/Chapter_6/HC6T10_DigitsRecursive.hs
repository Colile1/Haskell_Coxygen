-- HC6T10.hs : Digits of a number recursively
-- This file contains a recursive function to get the digits of a number as a list.

-- Pure function: Returns list of digits of a number recursively.
digits :: Int -> [Int]
digits n
  | n < 10 = [n]
  | otherwise = digits (n `div` 10) ++ [n `mod` 10]

main :: IO ()
main = do
    putStrLn ("digits 12345: " ++ show (digits 12345))
    putStrLn ("digits 7: " ++ show (digits 7))
