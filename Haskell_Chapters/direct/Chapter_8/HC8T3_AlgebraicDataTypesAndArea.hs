-- HC8T3.hs : Algebraic Data Types and Functions
-- This file defines Shape type and area function.

data Shape = Circle Float | Rectangle Float Float

area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h

circleArea :: Float
circleArea = area (Circle 5)

rectangleArea :: Float
rectangleArea = area (Rectangle 10 5)

main :: IO ()
main = do
    putStrLn "Circle area: "
    putStrLn (show circleArea)
    putStrLn "Rectangle area: "
    putStrLn (show rectangleArea)
