-- HC10T8.hs : AdvancedEq Subclass of Eq
-- This file defines a subclass AdvancedEq of Eq with an additional method.

-- Pure function: Defines the AdvancedEq type class.
class Eq a => AdvancedEq a where
    compareEquality :: a -> a -> Bool

-- Pure function: Implements AdvancedEq for Int.
instance AdvancedEq Int where
    compareEquality x y = x == y

main :: IO ()
main = do
    putStrLn ("Equal: " ++ show (compareEquality (5 :: Int) (5 :: Int)))
