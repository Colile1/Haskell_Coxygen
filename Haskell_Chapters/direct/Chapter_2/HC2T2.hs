-- HC2T2: Function Type Signatures

add :: Int -> Int -> Int
add x y = x + y

isEven :: Int -> Bool
isEven n = n `mod` 2 == 0

concatStrings :: String -> String -> String
concatStrings s1 s2 = s1 ++ s2

main = do
  print (add 1 2)
  print (isEven 4)
  print (concatStrings "Hello" "World")
