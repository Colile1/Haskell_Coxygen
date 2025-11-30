-- HC19T11.hs : Applicative Instance Wrapper
-- This file defines an Applicative instance for a custom data type Wrapper.

data Wrapper a = Wrapper a deriving Show

-- Pure function: Functor Instance
instance Functor Wrapper where
    fmap f (Wrapper x) = Wrapper (f x)

-- Pure function: Applicative Instance
instance Applicative Wrapper where
    pure = Wrapper
    (Wrapper f) <*> (Wrapper x) = Wrapper (f x)

-- Output logic
main :: IO ()
main = do
    let wFunc = Wrapper (+10)
    let wVal = Wrapper 5
    let result = wFunc <*> wVal
    putStrLn ("Wrapper Result: " ++ show result)
