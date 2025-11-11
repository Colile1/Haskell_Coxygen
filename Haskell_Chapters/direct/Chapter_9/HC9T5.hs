-- HC9T5.hs : Parametric Shape Data Type
-- This file defines a parametric data type Shape a with Circle and Rectangle constructors using record syntax.

-- Pure function: Defines the Shape data type with color field.
data Shape a = Circle { color :: a, radius :: Double } | Rectangle { color :: a, width :: Double, height :: Double }

main :: IO ()
main = do
    let circle = Circle { color = "Red", radius = 5.0 }
    let rectangle = Rectangle { color = "Blue", width = 10.0, height = 20.0 }
    putStrLn ("Circle: " ++ show circle)
    putStrLn ("Rectangle: " ++ show rectangle)
