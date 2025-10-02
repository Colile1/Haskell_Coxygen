-- HC1T3 - Task 3: Checking if a Number is Greater than 18
greaterThan18 :: Int -> Bool
greaterThan18 n = n > 18

main :: IO ()
main = do 
  print (greaterThan18 12)
  print (greaterThan18 19)
