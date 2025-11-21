-- HC10T6.hs : Mutual Recursion in Eq for Blockchain
-- This file modifies the Eq type class to use mutual recursion between == and /= in an instance for the Blockchain type.

-- Pure function: Defines the Blockchain data type.
data Blockchain = Blockchain [String] deriving Show

-- Pure function: Implements Eq for Blockchain using mutual recursion.
instance Eq Blockchain where
    (Blockchain xs) == (Blockchain ys) = length xs == length ys
    (Blockchain xs) /= (Blockchain ys) = not ((Blockchain xs) == (Blockchain ys))

main :: IO ()
main = do
    let bc1 = Blockchain ["block1", "block2"]
    let bc2 = Blockchain ["block1"]
    let bc3 = Blockchain ["block1", "block2"]
    putStrLn ("Equal: " ++ show (bc1 == bc3))
    putStrLn ("Not equal: " ++ show (bc1 /= bc2))
