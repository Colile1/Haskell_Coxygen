-- HC6T6.hs : Element exists in list
-- This file contains a function to check if an element exists in a list.

-- Pure function: Checks if an element exists in a list recursively.
elementExists :: Eq a => a -> [a] -> Bool
elementExists _ [] = False
elementExists e (x:xs) = (e == x) || elementExists e xs

main :: IO ()
main = do
    putStrLn ("elementExists 3 [1,2,3,4]: " ++ show (elementExists 3 [1,2,3,4]))
    putStrLn ("elementExists 5 [1,2,3,4]: " ++ show (elementExists 5 [1,2,3,4]))
