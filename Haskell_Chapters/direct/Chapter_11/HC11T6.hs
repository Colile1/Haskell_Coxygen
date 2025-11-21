-- HC11T6.hs : Uppercase Converter
-- This file reads a line, converts to uppercase, and prints.

import Data.Char (toUpper)

-- Pure function: Converts to uppercase.
toUpperCase :: String -> String
toUpperCase = map toUpper

-- Input wrapper: Gets line and returns uppercase.
get_toUpperCase :: IO String
get_toUpperCase = do
    putStrLn "Enter a line:"
    line <- getLine
    return (toUpperCase line)

main :: IO ()
main = do
    upper <- get_toUpperCase
    putStrLn ("Uppercase: " ++ upper)