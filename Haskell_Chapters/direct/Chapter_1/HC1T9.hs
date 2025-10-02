-- HC1T9: Check if x is greater than y using Ord class

isGreaterThan :: Ord a => a -> a -> Bool
isGreaterThan x y = x > y

main :: IO ()
main = do
  print ("Is 5 greater than 3? " ++ show (isGreaterThan 5 3))
  print ("Is 2 greater than 4? " ++ show (isGreaterThan 2 4))
