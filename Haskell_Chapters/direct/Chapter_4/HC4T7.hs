-- HC4T7.hs : First and third elements
-- This file contains a function that returns the first and third elements of a list, ignoring others.

-- Pure function: Returns first and third elements of a list if available.
firstAndThird :: Show a => [a] -> String
firstAndThird (x:_:z:_) = "The first and third elements are: " ++ show x ++ " and " ++ show z
firstAndThird _ = "Don't have them!"

main :: IO ()
main = do
    putStrLn ("firstAndThird [1,2,3,4]: " ++ firstAndThird [1,2,3,4])
    putStrLn ("firstAndThird [True, False, True]: " ++ firstAndThird [True, False, True])
    putStrLn ("firstAndThird [1]: " ++ firstAndThird [1])
