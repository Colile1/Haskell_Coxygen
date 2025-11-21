-- HC11T10.hs : Reverse User Input
-- This file reads input and reverses the string.

-- Pure function: Reverses string.
reverseInput :: String -> String
reverseInput = reverse

-- Input wrapper: Gets input and returns reversed.
get_reverseInput :: IO String
get_reverseInput = do
    putStrLn "Enter input:"
    input <- getLine
    return (reverseInput input)

main :: IO ()
main = do
    reversed <- get_reverseInput
    putStrLn ("Reversed: " ++ reversed)
