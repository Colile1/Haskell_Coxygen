-- HC9T8.hs : Recursive Sequence Data Type
-- This file defines a recursive data type Sequence a for a linear sequence of nodes.

-- Pure function: Defines the Sequence data type recursively.
data Sequence a = End | Node a (Sequence a) deriving Show

main :: IO ()
main = do
    let seq :: Sequence Int = Node 1 (Node 2 (Node 3 End))
    putStrLn ("Sequence: " ++ show seq)
