-- HC7T5.hs : Square Area Function
-- This file writes a function to calculate square area with Num constraint.

-- Pure function: Calculates square area.
squareArea :: Num a => a -> a
squareArea side = side * side

-- Input wrapper: Gets side length from input.
get_squareArea :: IO Double
get_squareArea = do
    putStrLn "Enter side length of square:"
    side <- readLn
    return (squareArea side)

-- Output logic: Prints the area.
main :: IO ()
main = do
    area <- get_squareArea
    putStrLn "Area: "
    putStrLn (show area)
