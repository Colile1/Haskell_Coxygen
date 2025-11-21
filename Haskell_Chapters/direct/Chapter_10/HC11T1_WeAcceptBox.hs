-- HC11T1.hs : WeAccept Instance for Box
-- This file creates a WeAccept instance for the Box type and writes a function that returns a list of accepted boxes.

-- Pure function: Defines the WeAccept type class.
class WeAccept a where
    fancyFunction :: a -> String

-- Pure function: Defines the Box type.
data Box a = Box a deriving Show

-- Pure function: Implements WeAccept for Box.
instance Show a => WeAccept (Box a) where
    fancyFunction (Box x) = "Accepted Box with " ++ show x

-- Pure function: returns a list of accepted boxes.
acceptedBoxes :: [Box String]
acceptedBoxes = [Box "Gold", Box "Silver", Box "Bronze"]

main :: IO ()
main = do
    putStrLn ("Fancy: " ++ fancyFunction (Box "Item"))
    putStrLn ("Boxes: " ++ show acceptedBoxes)
