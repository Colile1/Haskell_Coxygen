-- HC7T4.hs : Shape with Show and Read
-- This file defines Shape data type with Show and Read instances.

-- Pure function: Defines the Shape data type.
data Shape = Circle Double | Rectangle Double Double

-- Pure function: Implements Show for Shape.
instance Show Shape where
    show (Circle r) = "Circle " ++ show r
    show (Rectangle w h) = "Rectangle " ++ show w ++ " " ++ show h

-- Pure function: Implements Read for Shape.
instance Read Shape where
    readsPrec _ s = case words s of
        ["Circle", r] -> [(Circle (read r), "")]
        ["Rectangle", w, h] -> [(Rectangle (read w) (read h), "")]
        _ -> []

-- Input wrapper: Gets a shape string from input.
get_parseShape :: IO Shape
get_parseShape = do
    putStrLn "Enter shape (e.g., Circle 5.0 or Rectangle 3.0 4.0):"
    s <- getLine
    return (read s)

-- Output logic: Shows the shape.
main :: IO ()
main = do
    shape <- get_parseShape
    putStrLn "Shape: "
    putStrLn (show shape)
