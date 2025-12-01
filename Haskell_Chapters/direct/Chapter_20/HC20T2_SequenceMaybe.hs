-- HC20T2.hs : Sequence Maybe List
-- This file implements a function to convert a list of Maybe values into a Maybe of a list.

-- Pure function: Custom sequence implementation
-- If any element in the list is Nothing, the whole result is Nothing.
sequenceMaybe :: [Maybe a] -> Maybe [a]
sequenceMaybe [] = Just []
sequenceMaybe (mx:mxs) = do
    x <- mx
    xs <- sequenceMaybe mxs
    return (x:xs)

-- Output logic: 
main :: IO ()
main = do
    let list1 = [Just 1, Just 2, Just 3]
    let list2 = [Just 1, Nothing, Just 3]
    
    putStrLn ("Sequence Success: " ++ show (sequenceMaybe list1))
    putStrLn ("Sequence Fail: "    ++ show (sequenceMaybe list2))
