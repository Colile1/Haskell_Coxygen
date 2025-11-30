-- HC19T1.hs : Applicative Instance for Pair
-- This file demonstrates defining an Applicative instance for a custom data type Pair.

data Pair a = Pair a a deriving (Show, Eq)

-- Functor instance implementation: Applies a function to both elements inside the Pair context.
instance Functor Pair where
    fmap f (Pair x y) = Pair (f x) (f y)

-- Applicative instance implementation: Defines how to wrap a value (pure) and apply functions inside the Pair context (<*>).
-- pure duplicates the value; (<*>) applies functions element-wise (zipping semantics).
instance Applicative Pair where
    pure x = Pair x x
    (Pair f g) <*> (Pair x y) = Pair (f x) (g y)

-- Output logic to test the instance
main :: IO ()
main = do
    let pFunctions = Pair (*2) (+3)
    let pValues = Pair 10 20
    let result = pFunctions <*> pValues
    putStrLn ("Result Pair: " ++ show result)

    -- Quick identity law check: pure id <*> v == v
    putStrLn ("Identity Law Check: " ++ show ((pure id <*> pValues) == pValues))
