-- HC11T7.hs : Ord Instance for Box
-- This file implements the Ord instance for the Box type using the compare function.

-- Pure function: Defines the Box type.
data Box a = Box a deriving (Show, Eq)

-- Pure function: Implements Ord for Box.
instance Ord a => Ord (Box a) where
    compare (Box x) (Box y) = compare x y

main :: IO ()
main = do
    let box1 = Box 5
    let box2 = Box 3
    putStrLn ("Compare: " ++ show (compare box1 box2))
    putStrLn ("Max: " ++ show (max box1 box2))
