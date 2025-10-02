-- HC3T4.hs : Calculate triangle area
-- This file contains a function to calculate the area of a triangle using Heron's formula.

-- Pure function: Calculates the area of a triangle using Heron's formula.
triangleArea :: Float -> Float -> Float -> Float
triangleArea a b c = let s = (a + b + c) / 2
                     in sqrt (s * (s - a) * (s - b) * (s - c))

main :: IO ()
main = do
    putStrLn ("triangleArea 3 4 5: " ++ show (triangleArea 3 4 5))
    putStrLn ("triangleArea 7 8 9: " ++ show (triangleArea 7 8 9))
