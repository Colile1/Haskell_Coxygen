-- HC10T4.hs : Eq Instance for Box
-- This file creates a parameterized type Box a and makes it an instance of Eq.

-- Pure function: Defines the Box data type.
data Box a = Box a deriving Show

-- Pure function: Implements Eq for Box a.
instance Eq a => Eq (Box a) where
    (Box x) == (Box y) = x == y

main :: IO ()
main = do
    let box1 = Box 5
    let box2 = Box 5
    let box3 = Box 10
    putStrLn ("Box 5 == Box 5: " ++ show (box1 == box2))
    putStrLn ("Box 5 == Box 10: " ++ show (box1 == box3))
