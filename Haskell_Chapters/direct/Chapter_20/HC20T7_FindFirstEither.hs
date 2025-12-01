-- HC20T7.hs : Find First Either
-- This file uses the Either monad to handle errors when searching a list.

-- Pure function: Search for an element
findFirst :: (Eq a) => a -> [a] -> Either String Int
findFirst _ [] = Left "Element not found in list."
findFirst target (x:xs)
    | target == x = Right 0
    | otherwise   = do
        idx <- findFirst target xs
        return (idx + 1)

-- Output logic: 
main :: IO ()
main = do
    let list = [10, 20, 30, 40]
    putStrLn ("Searching for 30: " ++ show (findFirst 30 list))
    putStrLn ("Searching for 99: " ++ show (findFirst 99 list))
