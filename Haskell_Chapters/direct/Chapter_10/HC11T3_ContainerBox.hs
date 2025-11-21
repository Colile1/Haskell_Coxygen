-- HC11T3.hs : Container Type Class for Box
-- This file defines a Container type class with the methods isEmpty, contains, and replace, then implements an instance for the Box type.

-- Pure function: Defines the Container type class.
class Container c where
    isEmpty :: c a -> Bool
    contains :: Eq a => a -> c a -> Bool
    replace :: a -> c a -> c a

-- Pure function: Defines the Box type.
data Box a = Box a deriving Show

-- Pure function: Implements Container for Box.
instance Container Box where
    isEmpty (Box _) = False
    contains item (Box x) = item == x
    replace item _ = Box item

main :: IO ()
main = do
    let box = Box "Treasure"
    putStrLn ("Is empty: " ++ show (isEmpty box))
    putStrLn ("Contains: " ++ show (contains "Treasure" box))
    putStrLn ("Replaced: " ++ show (replace "New" box))
