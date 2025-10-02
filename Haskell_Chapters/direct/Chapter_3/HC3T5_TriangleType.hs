-- HC3T5.hs : Determine triangle type
-- This file contains a function to determine the type of a triangle using guards.

-- Pure function: Determines the type of a triangle using guards.
triangleType :: Float -> Float -> Float -> String
triangleType a b c
  | a == b && b == c = "Equilateral"
  | a == b || b == c || a == c = "Isosceles"
  | otherwise = "Scalene"

main :: IO ()
main = do
    putStrLn ("triangleType 3 3 3: " ++ triangleType 3 3 3)
    putStrLn ("triangleType 5 5 8: " ++ triangleType 5 5 8)
    putStrLn ("triangleType 6 7 8: " ++ triangleType 6 7 8)
