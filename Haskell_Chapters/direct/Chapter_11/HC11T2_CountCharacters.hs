-- HC11T2.hs : Count Characters in a Line
-- This file reads a line and prints the character count.

-- Pure function: Counts characters in a string.
countChars :: String -> Int
countChars = length

-- Input wrapper: Gets the line and returns count.
get_countChars :: IO Int
get_countChars = do
    putStrLn "Enter a line:"
    line <- getLine
    return (countChars line)

main :: IO ()
main = do
    count <- get_countChars
    putStrLn ("Characters: " ++ show count)
