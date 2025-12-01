-- HC20T15.hs : Tree Sum Custom Monad
-- This file computes the sum of a tree using a custom Monad definition.

-- Data: Binary Tree
data Tree a = Empty | Node a (Tree a) (Tree a)

-- Data: Custom Monad (SumM)
-- Simple wrapper around a value, essentially Identity but custom named.
newtype SumM a = SumM { runSumM :: a } deriving Show

-- Pure function: Functor
instance Functor SumM where
    fmap f (SumM x) = SumM (f x)

-- Pure function: Applicative
instance Applicative SumM where
    pure = SumM
    (SumM f) <*> (SumM x) = SumM (f x)

-- Pure function: Monad
instance Monad SumM where
    return = pure
    (SumM x) >>= f = f x

-- Pure function: Sums the tree using the custom monad
treeSum :: Num a => Tree a -> SumM a
treeSum Empty = return 0
treeSum (Node x left right) = do
    l <- treeSum left
    r <- treeSum right
    return (x + l + r)

-- Output logic: 
main :: IO ()
main = do
    let tree = Node 10 (Node 5 Empty Empty) (Node 20 Empty Empty)
    let result = runSumM (treeSum tree)
    putStrLn ("Tree Sum: " ++ show result)
