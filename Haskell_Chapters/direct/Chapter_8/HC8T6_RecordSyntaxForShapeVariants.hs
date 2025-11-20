-- HC8T6.hs : Record Syntax for Shape Variants
-- This file defines Shape type using record syntax for circles and rectangles.

data Shape = Circle { center :: (Float, Float), color :: String, radius :: Float }
           | Rectangle { center :: (Float, Float), width :: Float, height :: Float, color :: String } deriving (Show)

circleShape :: Shape
circleShape = Circle { center = (0.0, 0.0), color = "Red", radius = 5.0 }

rectangleShape :: Shape
rectangleShape = Rectangle { center = (1.0, 1.0), width = 10.0, height = 5.0, color = "Blue" }

main :: IO ()
main = do
    putStrLn "Circle: "
    putStrLn (show circleShape)
    putStrLn "Rectangle: "
    putStrLn (show rectangleShape)
