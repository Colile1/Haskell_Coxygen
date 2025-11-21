-- HC11T10.hs : sortContainers Function
-- This file implements a function sortContainers that sorts a list of containers using the derived Ord instance.

import Data.List (sort)

-- Pure function: Defines the Container type class.
class Container c where
    isEmpty :: c a -> Bool
    contains :: Eq a => a -> c a -> Bool
    replace :: a -> c a -> c a

-- Pure function: Defines the Box type.
data Box a = Box a deriving (Show, Eq, Ord)

-- Pure function: Implements Container for Box.
instance Container Box where
    isEmpty (Box _) = False
    contains item (Box x) = item == x
    replace item _ = Box item

-- Pure function: sortContainers function.
sortContainers :: Ord a => [Box a] -> [Box a]
sortContainers = sort

main :: IO ()
main = do
    let boxes = [Box 3, Box 1, Box 2]
    putStrLn ("Sorted: " ++ show (sortContainers boxes))
