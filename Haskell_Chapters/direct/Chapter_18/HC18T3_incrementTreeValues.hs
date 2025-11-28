-- HC18T3: incrementTreeValues Function
-- Define a function incrementTreeValues that adds one to every value in a tree using the Functor instance.

data Tree a
    = Empty
    | Node a (Tree a) (Tree a)
    deriving (Show)

instance Functor Tree where
    fmap _ Empty = Empty
    fmap f (Node value left right) = Node (f value) (fmap f left) (fmap f right)

incrementTreeValues :: Tree Int -> Tree Int
incrementTreeValues = fmap (+1)

exampleTree :: Tree Int
exampleTree = Node 10
    (Node 5 Empty Empty)
    (Node 20 Empty Empty)

main :: IO ()
main = do
    putStrLn "Original Tree:"
    print exampleTree
    putStrLn "Incremented Tree:"
    print (incrementTreeValues exampleTree)
