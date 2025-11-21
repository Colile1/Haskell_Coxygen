-- HC10T3.hs : Comparable Type Class
-- This file defines a Comparable type class and implements it for Blockchain.

-- Pure function: Defines the Blockchain data type.
data Blockchain = Blockchain [String] deriving Show

-- Pure function: Defines the Comparable type class.
class Comparable a where
    compareWith :: a -> a -> Ordering

-- Pure function: Implements Comparable for Blockchain.
instance Comparable Blockchain where
    compareWith (Blockchain xs) (Blockchain ys) = compare (length xs) (length ys)

main :: IO ()
main = do
    let bc1 = Blockchain ["block1", "block2"]
    let bc2 = Blockchain ["block1"]
    putStrLn ("Comparison: " ++ show (compareWith bc1 bc2))
