-- HC7T9.hs : Describable Type Class
-- This file creates the Describable type class with instances for Bool and Shape.

-- Pure function: Defines the Shape data type.
data Shape = Circle Double | Rectangle Double Double deriving (Show, Read)

-- Pure function: Defines the Describable type class.
class Describable a where
    describe :: a -> String

-- Pure function: Implements Describable for Bool.
instance Describable Bool where
    describe True = "True value"
    describe False = "False value"

-- Pure function: Implements Describable for Shape.
instance Describable Shape where
    describe (Circle r) = "Circle with radius " ++ show r
    describe (Rectangle w h) = "Rectangle with width " ++ show w ++ " and height " ++ show h

-- Input wrapper: Gets a Bool from input.
get_describeBool :: IO String
get_describeBool = do
    putStrLn "Enter Bool (True or False):"
    b <- readLn
    return (describe b)

-- Input wrapper: Gets a Shape from input.
get_describeShape :: IO String
get_describeShape = do
    putStrLn "Enter shape (e.g., Circle 5.0):"
    s <- getLine
    let shape = read s :: Shape
    return (describe shape)

main :: IO ()
main = do
    descBool <- get_describeBool
    putStrLn "Bool description: "
    putStrLn descBool
    descShape <- get_describeShape
    putStrLn "Shape description: "
    putStrLn descShape
