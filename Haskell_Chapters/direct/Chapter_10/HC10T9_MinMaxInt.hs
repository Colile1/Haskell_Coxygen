-- HC10T9.hs : MinMax Type Class
-- This file defines a MinMax type class and implements it for Int.

-- Pure function: Defines the MinMax type class.
class MinMax a where
    minValue :: a
    maxValue :: a

-- Pure function: Implements MinMax for Int.
instance MinMax Int where
    minValue = minBound
    maxValue = maxBound

main :: IO ()
main = do
    putStrLn ("Min: " ++ show (minValue :: Int))
    putStrLn ("Max: " ++ show (maxValue :: Int))
