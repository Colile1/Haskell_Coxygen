-- HC9T10.hs : Binary Search Tree Data Type
-- This file defines a binary search tree type BST a.

-- Pure function: Defines the BST data type recursively.
data BST a = EmptyTree | Node a (BST a) (BST a) deriving Show

main :: IO ()
main = do
    let tree = Node 5 (Node 3 EmptyTree EmptyTree) (Node 7 EmptyTree EmptyTree)
    putStrLn ("BST: " ++ show tree)
