import Data.List (sortBy)
import Data.Function (on)

-- HC1T1 -- Task 1: Function Composition
double :: Int -> Int
double n = 2*n

increment :: Int -> Int
increment n = n + 1

doubleThenIncrement :: Int -> Int
doubleThenIncrement = increment . double

-- HC1T2
circleArea :: Double -> Double
circleArea r = pi * r * r

-- HC1T3
greaterThan18 :: Int -> Bool
greaterThan18 x = x > 18

-- HC1T4
extractPlayers :: [(String, Int)] -> [String]
extractPlayers = map fst

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore = sortBy (flip compare `on` snd)

topThree :: [a] -> [a]
topThree = take 3

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore

-- HC1T5
infiniteNumbers :: [Int]
infiniteNumbers = [1..]

-- HC1T6
addNumbers :: Int -> Int -> Int
addNumbers x y = x + y

-- HC1T7
fToC :: Double -> Double
fToC f = (f - 32) * 5 / 9

-- HC1T8
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- testing all
main :: IO ()
main = do
  print (doubleThenIncrement 7)
  print (circleArea 3.0)
  print (greaterThan18 20)
  print (getTopThreePlayers [("Alice", 10), ("Bob", 20), ("Charlie", 15), ("Dave", 5)])
  print (take 10 infiniteNumbers)
  print (addNumbers 3 4)
  print (fToC 32.0)
  print (applyTwice (+3) 10)
