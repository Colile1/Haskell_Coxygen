-- HC12T8: Merge Two Sorted Lists

mergeLists :: Ord a => [a] -> [a] -> [a]
mergeLists [] ys = ys
mergeLists xs [] = xs
mergeLists (x:xs) (y:ys) = if x <= y then x : mergeLists xs (y:ys) else y : mergeLists (x:xs) ys

main :: IO ()
main = print (mergeLists [1,3,5] [2,4,6])
