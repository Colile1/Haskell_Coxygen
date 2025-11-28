-- HC16T10: Character Frequency in String
-- Define a function that counts the frequency of each character in a string.

import Data.Map (fromListWith, toList)

charFrequency :: String -> [(Char, Int)]
charFrequency str = toList (fromListWith (+) [(c, 1) | c <- str])

main :: IO ()
main = do
    putStrLn "Enter a string to count character frequencies:"
    input <- getLine
    let freq = charFrequency input
    putStrLn "Character frequencies:"
    mapM_ (\(c, count) -> putStrLn $ show c ++ ": " ++ show count) freq
