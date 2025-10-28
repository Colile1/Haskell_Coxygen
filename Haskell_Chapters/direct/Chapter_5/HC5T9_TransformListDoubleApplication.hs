-- HC5T9.hs : Transform list
-- This file contains a higher-order function that applies a function twice to each element.

-- Pure function: Applies a function twice to each element of a list.
transformList :: (a -> a) -> [a] -> [a]
transformList f = map (f . f)

main :: IO ()
main = do
    putStrLn ("transformList (+1) [1,2,3]: " ++ show (transformList (+1) [1,2,3]))
    putStrLn ("transformList (*2) [1,2,3]: " ++ show (transformList (*2) [1,2,3]))
