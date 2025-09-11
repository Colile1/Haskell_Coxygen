-- HC1T4
import Data.List (sortBy)
import Data.Ord (comparing)

extractPlayers :: [(String, Int)] -> [String]
extractPlayers = map fst

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore = sortBy (flip compare `on` snd)

topThree :: [a] -> [a]
topThree = take 3

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore

main :: IO ()
main = print (getTopThreePlayers [("Alice", 10), ("Bob", 20), ("Charlie", 15), ("Dave", 5)])
