-- HC12T6: Sort a List of Integers

import Data.List (sort)

main :: IO ()
main = do
  putStrLn "Enter list of integers:"
  input <- getLine
  let nums = map read (words input) :: [Int]
  print (sort nums)
