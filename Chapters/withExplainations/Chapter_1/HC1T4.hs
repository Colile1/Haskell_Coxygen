-- HC1T4 - Task 4: Composing a Function to Process Player Data
-- This code defines functions to extract player names, sort players by score descending, take top three, and composes them into getTopThreePlayers.

import Data.List (sortBy)  -- Import sortBy from Data.List for sorting
import Data.Ord (comparing)  -- Import comparing from Data.Ord for comparison

extractPlayers :: [(String, Int)] -> [String]  -- Type: takes list of (name,score), returns list of names
extractPlayers = map fst  -- Maps fst to get first element (name) from each tuple; alternative: use [name | (name,_) <- list]

sortByScore :: [(String, Int)] -> [(String, Int)]  -- Type: takes list of players, returns sorted list
sortByScore = sortBy (flip compare `on` snd)  -- Sorts by score descending using flip compare on snd; alternative: sortBy (comparing (negate . snd))

topThree :: [a] -> [a]  -- Type: takes a list, returns first 3 elements
topThree = take 3  -- Takes the first 3 elements; alternative: use drop 0 . take 3 or head of list if length >=3

getTopThreePlayers :: [(String, Int)] -> [String]  -- Composed function
getTopThreePlayers = extractPlayers . topThree . sortByScore  -- Composes: sort by score, take top 3, extract names

main :: IO ()  -- Main for testing
main = print (getTopThreePlayers [("Alice", 10), ("Bob", 20), ("Charlie", 15), ("Dave", 5)])  -- Expected: ["Bob","Charlie","Alice"]
