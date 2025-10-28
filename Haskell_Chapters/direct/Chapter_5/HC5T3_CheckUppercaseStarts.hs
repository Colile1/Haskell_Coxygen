-- HC5T3.hs : Check for uppercase start
-- This file contains a function that checks if any word in a list starts with uppercase.

import Data.Char (isUpper)

-- Pure function: Checks if any word starts with uppercase.
hasUpperStart :: [String] -> Bool
hasUpperStart words = any (\w -> not (null w) && isUpper (head w)) words

main :: IO ()
main = do
    putStrLn ("hasUpperStart [\"hello\", \"World\"]: " ++ show (hasUpperStart ["hello", "World"]))
    putStrLn ("hasUpperStart [\"hello\", \"world\"]: " ++ show (hasUpperStart ["hello", "world"]))
