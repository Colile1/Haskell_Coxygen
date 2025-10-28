-- HC6T9.hs : Map implementation
-- This file contains a function to apply a function to each element of a list (map implementation).

-- Pure function: Applies a function to each element of a list recursively.
mapRecursive :: (a -> b) -> [a] -> [b]
mapRecursive _ [] = []
mapRecursive f (x:xs) = f x : mapRecursive f xs

main :: IO ()
main = do
    putStrLn ("mapRecursive (*2) [1,2,3]: " ++ show (mapRecursive (*2) [1,2,3]))
    putStrLn ("mapRecursive (+1) []: " ++ show (mapRecursive (+1) []))
