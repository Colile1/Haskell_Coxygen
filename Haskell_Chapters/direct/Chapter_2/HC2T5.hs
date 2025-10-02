-- HC2T5: Defining and Using Functions

circleArea :: Float -> Float
circleArea r = pi * r * r

maxOfThree :: Int -> Int -> Int -> Int
maxOfThree a b c = max a (max b c)

main = do
  print (circleArea 1.0)
  print (maxOfThree 1 2 3)
