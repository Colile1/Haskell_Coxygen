-- HC11T4.hs : Concatenate Two Lines
-- This file reads two lines and prints them concatenated.

-- Pure function: Concatenates two strings.
concatLines :: String -> String -> String
concatLines a b = a ++ b

-- Input wrapper: Gets two lines and returns concatenated.
get_concatLines :: IO String
get_concatLines = do
    putStrLn "Enter first line:"
    line1 <- getLine
    putStrLn "Enter second line:"
    line2 <- getLine
    return (concatLines line1 line2)

main :: IO ()
main = do
    result <- get_concatLines
    putStrLn ("Concatenated: " ++ result)
