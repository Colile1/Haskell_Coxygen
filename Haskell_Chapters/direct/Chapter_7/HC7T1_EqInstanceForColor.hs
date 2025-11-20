-- HC7T1.hs : Eq Instance for Color
-- This file implements the Eq type class for a custom Color data type.

-- Pure function: Defines the Color data type.
data Color = Red | Green | Blue

-- Pure function: Implements equality for Color.
instance Eq Color where
    Red == Red = True
    Green == Green = True
    Blue == Blue = True
    _ == _ = False

main :: IO ()
main = do
    putStrLn "Red == Red: True"
    putStrLn (show (Red == Red))
    putStrLn "Red == Green: False"
    putStrLn (show (Red == Gr7een))
