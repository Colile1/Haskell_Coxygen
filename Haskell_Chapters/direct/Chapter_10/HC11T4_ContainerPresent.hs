-- HC11T4.hs : Container Instance for Present
-- This file implements the Container type class for the Present type.

-- Pure function: Defines the Present data type.
data Present a = Present a deriving Show

-- Pure function: Defines the Container type class.
class Container c where
    isEmpty :: c a -> Bool
    contains :: Eq a => a -> c a -> Bool
    replace :: a -> c a -> c a

-- Pure function: Implements Container for Present.
instance Container Present where
    isEmpty _ = False
    contains item (Present x) = item == x
    replace item _ = Present item

main :: IO ()
main = do
    let present = Present "Gift"
    putStrLn ("Contains: " ++ show (contains "Gift" present))
