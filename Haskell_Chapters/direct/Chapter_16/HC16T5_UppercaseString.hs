-- HC16T5: Uppercase String
-- Define a function to convert all characters in a string to uppercase.

import Data.Char (toUpper)

toUpperString :: String -> String
toUpperString = map toUpper

main :: IO ()
main = do
    putStrLn "Enter a string to convert to uppercase:"
    input <- getLine
    let upper = toUpperString input
    putStrLn $ "Uppercase string: " ++ upper
