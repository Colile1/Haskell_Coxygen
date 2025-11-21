-- HC10T2.hs : Summable Type Class
-- This file defines a Summable type class and implements it for Int.

-- Pure function: Defines the Summable type class.
class Summable a where
    sumUp :: [a] -> a

-- Pure function: Implements Summable for Int.
instance Summable Int where
    sumUp = sum

main :: IO ()
main = do
    let nums :: [Int]
        nums = [1, 2, 3, 4]
    putStrLn ("Sum: " ++ show (sumUp nums))
