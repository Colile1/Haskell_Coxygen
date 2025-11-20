-- HC9T9.hs : Check Element in Sequence
-- This file creates a function to check if an element is in a Sequence.

-- Pure function: Defines the Sequence data type.
data Sequence a = End | Node a (Sequence a) deriving Show

-- Pure function: Checks if an element is in the sequence.
elemSeq :: Eq a => a -> Sequence a -> Bool
elemSeq _ End = False
elemSeq x (Node y rest) = x == y || elemSeq x rest

main :: IO ()
main = do
    let seq = Node 1 (Node 2 (Node 3 End))
    putStrLn ("Contains 2: " ++ show (elemSeq 2 seq))
    putStrLn ("Contains 4: " ++ show (elemSeq 4 seq))
