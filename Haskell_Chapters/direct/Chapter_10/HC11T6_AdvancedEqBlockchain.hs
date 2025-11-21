-- HC11T6.hs : AdvancedEq for Blockchain
-- This file defines a type class AdvancedEq that extends Eq and adds a method compareEquality,
-- then implements it for the Blockchain type.

-- Pure function: Defines the AdvancedEq type class.
class Eq a => AdvancedEq a where
    compareEquality :: a -> a -> Bool

-- Pure function: Defines the Blockchain data type.
data Blockchain = Blockchain [String] deriving Show

-- Pure function: Implements Eq for Blockchain.
instance Eq Blockchain where
    (Blockchain xs) == (Blockchain ys) = length xs == length ys

-- Pure function: Implements AdvancedEq for Blockchain.
instance AdvancedEq Blockchain where
    compareEquality (Blockchain xs) (Blockchain ys) = length xs == length ys

main :: IO ()
main = do
    let bc1 = Blockchain ["block1", "block2"]
    let bc2 = Blockchain ["block1"]
    putStrLn ("Equal: " ++ show (compareEquality bc1 bc1))
    putStrLn ("Not equal: " ++ show (compareEquality bc1 bc2))
