-- HC7T6.hs : Circle Circumference Function
-- This file writes a function to calculate circle circumference with Floating constraint.

-- Pure function: Calculates circle circumference.
circleCircumference :: Floating a => a -> a
circleCircumference radius = 2 * pi * radius

-- Input wrapper: Gets radius from input.
get_circleCircumference :: IO Double
get_circleCircumference = do
    putStrLn "Enter radius:"
    radius <- readLn
    return (circleCircumference radius)

-- Output logic: Prints the circumference.
main :: IO ()
main = do
    circumference <- get_circleCircumference
    putStrLn "Circumference: "
    putStrLn (show circumference)
