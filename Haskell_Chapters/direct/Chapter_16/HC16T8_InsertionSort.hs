-- HC16T8: Insertion Sort
-- Define a function that sorts a list of integers using the insertion sort algorithm.

insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
  where
    insert y [] = [y]
    insert y (z:zs) | y <= z    = y : z : zs
                    | otherwise = z : insert y zs

main :: IO ()
main = do
    putStrLn "Enter a list of integers separated by spaces:"
    input <- getLine
    let nums = map read (words input) :: [Int]
    let sorted = insertionSort nums
    putStrLn $ "Sorted list: " ++ show sorted
