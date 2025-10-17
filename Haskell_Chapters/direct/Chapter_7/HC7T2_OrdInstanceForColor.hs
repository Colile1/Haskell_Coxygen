-- HC7T2.hs : Ord Instance for Color
-- This file implements the Ord type class for the Color data type.

-- Pure function: Defines the Color data type.
data Color = Red | Green | Blue

-- Pure function: Implements equality for Color.
instance Eq Color where
    Red == Red = True
    Green == Green = True
    Blue == Blue = True
    _ == _ = False

-- Pure function: Implements ordering for Color.
instance Ord Color where
    compare Red Green = LT
    compare Red Blue = LT
    compare Green Blue = LT
    compare Green Red = GT
    compare Blue Red = GT
    compare Blue Green = GT
    compare _ _ = EQ

-- Output logic: Demonstrates ordering.
main :: IO ()
main = do
    putStrLn "Red < Green: True"
    putStrLn (show (Red < Green))
    putStrLn "Green < Blue: True"
    putStrLn (show (Green < Blue))
    putStrLn "Blue < Red: False"
    putStrLn (show (Blue < Red))
