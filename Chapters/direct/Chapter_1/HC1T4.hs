-- HC1T4: Composing a Function to Process Player Data

import Data.List (sortBy)
import Data.Function (on)

extractPlayers :: [(String, Int)] -> [String]
extractPlayers = map fst

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore = sortBy (flip compare `on` snd)

topThree :: [a] -> [a]
topThree = take 3

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore

main :: IO ()
main = print (getTopThreePlayers [
    ("Colile", 20),
    ("Sabelo", 12),
    ("Themba", 16),
    ("Cirie", 10),
    ("Anele", 8),
    ("Zinhle", 14)
    ])
