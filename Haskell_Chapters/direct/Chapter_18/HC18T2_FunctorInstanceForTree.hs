-- HC18T2: Functor Instance for Tree
-- Create a Functor instance for the binary tree type Tree.

-- binary tree
data Tree a
    = Empty
    | Node a (Tree a) (Tree a)
    deriving (Show)

-- main

instance Functor Tree where 
    fmap _ Empty = Empty
    fmap f (Node value left right) = Node (f value) (fmap f left) (fmap f right)

exampleTree :: Tree Int
exampleTree = Node 10 
    (Node 5 Empty Empty)
    (Node 20 Empty Empty)

main :: IO ()
main = do
    putStrLn "Original Tree:"
    print exampleTree
    putStrLn "Mapped Tree (doubled values):"
    print (fmap (*2) exampleTree)
