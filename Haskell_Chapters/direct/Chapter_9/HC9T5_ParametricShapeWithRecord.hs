-- HC9T5.hs : Parametric Shape Data Type
-- This file defines a parametric data type Shape a with Circle and Rectangle constructors using record syntax.


-- Pure function: Defines the Shape data type with color field.

data Shape a = Circle { color :: a, radius :: Double } | Rectangle { color :: a, width :: Double, height :: Double }

-- Pure function: Defines the Show instance for Shape.
instance Show a => Show (Shape a) where
    show (Circle c r) = "Circle {color = " ++ show c ++ ", radius = " ++ show r ++ "}"
    show (Rectangle c w h) = "Rectangle {color = " ++ show c ++ ", width = " ++ show w ++ ", height = " ++ show h ++ "}"


main :: IO ()
main = do
    let circle = Circle { color = "Red", radius = 5.0 }
    let rectangle = Rectangle { color = "Blue", width = 10.0, height = 20.0 }
    putStrLn ("Circle: " ++ show circle)
    putStrLn ("Rectangle: " ++ show rectangle)
