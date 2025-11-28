-- HC16T9: Remove Duplicates from List
-- Implement a function to remove duplicates from a list.

removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs) = x : removeDuplicates (filter (/= x) xs)

main :: IO ()
main = do
    putStrLn "Enter a list of elements separated by spaces:"
    input <- getLine
    let list = words input
    let unique = removeDuplicates list
    putStrLn $ "List without duplicates: " ++ show unique
