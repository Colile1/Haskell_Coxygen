-- HC3T2.hs : Determine grade from score
-- This file contains a function to determine the grade based on a score using guards.

-- Pure function: Determines grade from score using guards.
grade :: Int -> String
grade n
  | n >= 90 = "A"
  | n >= 80 = "B"
  | n >= 70 = "C"
  | n >= 60 = "D"
  | otherwise = "F"

main = do
  putStrLn (grade 95)
  putStrLn (grade 72)
  putStrLn (grade 50)
