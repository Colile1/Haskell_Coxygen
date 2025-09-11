-- HC1T5 - Task 5: Laziness in Haskell
-- This code demonstrates laziness by defining an infinite list of numbers and extracting only the first n elements without evaluating the whole list.

infiniteNumbers :: [Int]  -- Type: infinite list of Int
infiniteNumbers = [1..]  -- Generates infinite list starting from 1; alternative: use iterate (+1) 1

main :: IO ()  -- Main for testing laziness
main = print (take 10 infiniteNumbers)  -- Takes first 10 elements lazily; alternative: use [1..10] but that would not use infinite list
