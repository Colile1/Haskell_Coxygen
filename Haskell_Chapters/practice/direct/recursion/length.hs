length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs 

main do
    length 10
    