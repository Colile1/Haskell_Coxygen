-- HC5T1.hs : Apply function three times
-- This file contains a function that applies a given function three times to an integer.

-- Pure function: Applies a function three times to a value.
applyThrice :: (a -> a) -> a -> a
applyThrice f x = f (f (f x))

main :: IO ()
main = do
    putStrLn ("applyThrice (+1) 0: " ++ show (applyThrice (+1) 0))
    putStrLn ("applyThrice (*2) 1: " ++ show (applyThrice (*2) 1))
