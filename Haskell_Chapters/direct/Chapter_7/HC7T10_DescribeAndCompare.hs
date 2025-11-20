-- HC7T10.hs : Describe and Compare Function
-- This file writes a function to describe and compare Describable values.
data Shape = Circle Double | Rectangle Double Double deriving (Show, Read, Eq, Ord)
class Describable a where
    describe :: a -> String
instance Describable Bool where
    describe True = "True value"
    describe False = "False value"
instance Describable Shape where
    describe (Circle r) = "Circle with radius " ++ show r
    describe (Rectangle w h) = "Rectangle with width " ++ show w ++ " and height " ++ show h

-- Pure function: Describes the larger of two Describable values.
describeAndCompare :: (Describable a, Ord a) => a -> a -> String
describeAndCompare x y = describe (max x y)

-- Input wrapper: Gets two Bools from input.
get_describeAndCompareBool :: IO String
get_describeAndCompareBool = do
    putStrLn "Enter first Bool:"
    x <- readLn
    putStrLn "Enter second Bool:"
    y <- readLn
    return (describeAndCompare x y)

-- Input wrapper: Gets two Shapes from input.
get_describeAndCompareShape :: IO String
get_describeAndCompareShape = do
    putStrLn "Enter first shape (e.g., Circle 5.0):"
    s1 <- getLine
    let x = read s1 :: Shape
    putStrLn "Enter second shape (e.g., Rectangle 3.0 4.0):"
    s2 <- getLine
    let y = read s2 :: Shape
    return (describeAndCompare x y)

main :: IO ()
main = do
    descBool <- get_describeAndCompareBool
    putStrLn "Larger Bool description: "
    putStrLn descBool
    descShape <- get_describeAndCompareShape
    putStrLn "Larger Shape description: "
    putStrLn descShape
