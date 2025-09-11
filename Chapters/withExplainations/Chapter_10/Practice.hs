-- Practice - Using Guards for Even or Odd Function
-- This code defines a function that uses guards to determine if a number is even or odd, returning a string description.

isEvenOrOdd :: Int -> String  -- Type signature for the function; alternative: use Bool return type
isEvenOrOdd n  -- Function definition with parameter n
  | even n = "Even"  -- Guard: if n is even, return "Even"; alternative: use n `mod` 2 == 0
  | otherwise = "Odd"  -- Otherwise, return "Odd"; alternative: use if-then-else

main :: IO ()  -- Main for testing
main = print (isEvenOrOdd 4)  -- Prints "Even"; alternative: test with odd number


-- fUNCTION THAT CHECKS IF A fUNCTION IS DIVIDABLE BY 3
isDividableBy3 :: Int -> String  -- Type signature for the function; alternative: use Bool return type
isDividableBy3 n  -- Function definition with parameter n
    | n `mod` 3 == 0 = "Dividable by 3"  -- Guard: if n is dividable by 3, return "Dividable by 3"; alternative: use even n
    | otherwise = "Not Dividable by 3"  -- Otherwise, return "Not Dividable by 3"; alternative: use if-then-else
main2 :: IO ()  -- Main for testing
main2 = print (isDividableBy3 9)  -- Prints "Dividable by 3"; alternative: test with non-dividable number

-- FUNCTION THAT CHECKS IF A fUNCTION IS DIVIDABLE BY 5
isDividableBy5 :: Int -> String  -- Type signature for the function; alternative: use Bool return type
isDividableBy5 n  -- Function definition with parameter n
    | n `mod` 5 == 0 = "Dividable by 5"  -- Guard: if n is dividable by 5, return "Dividable by 5"; alternative: use even n
    | otherwise = "Not Dividable by 5"  -- Otherwise, return "Not Dividable by 5"; alternative: use if-then-else
main3 :: IO ()  -- Main for testing
main3 = print (isDividableBy5 10)  -- Prints "Dividable by 5"; alternative: test with non-dividable number


-- Funtion that checks if a triangle is an equilateral triangle, isosceles triangle or a scalene triangle 
triangleType :: (Eq a) => a -> a -> a -> String  -- Type signature for the function; alternative: use specific numeric type
triangleType a b c  -- Function definition with parameters a, b, c
    | a == b && b == c = "Equilateral triangle"  -- Guard: if all sides are equal, return "Equilateral triangle"; alternative: use pattern matching
    | a == b || b == c || a == c = "Isosceles triangle"  -- Guard: if two sides are equal, return "Isosceles triangle"; alternative: use case expression
    | otherwise = "Scalene triangle"  -- Otherwise, return "Scalene triangle"; alternative: use if-then-else
main4 :: IO ()  -- Main for testing
main4 = print (triangleType 3 3 3)  -- Prints "Equilateral triangle"; alternative: test with other triangle types 
main5 :: IO ()  -- Main for testing
main5 = print (triangleType 3 4 3)  -- Prints "Is


-- Funtion that checks if a triangle is an equilateral triangle, isosceles triangle or a scalene triangle without using polymorphism
triangleTypeInt :: Int -> Int -> Int -> String  -- Type signature for the function; alternative: use specific numeric type
triangleTypeInt a b c  -- Function definition with parameters a, b, c
    | a == b && b == c = "Equilateral triangle"  -- Guard: if all sides are equal, return "Equilateral triangle"; alternative: use pattern matching
    | a == b || b == c || a == c = "Isosceles triangle"  -- Guard: if two sides are equal, return "Isosceles triangle"; alternative: use case expression
    | otherwise = "Scalene triangle"  -- Otherwise, return "Scalene triangle"; alternative: use if-then-else
main6 :: IO ()  -- Main for testing
main6 = print (triangleTypeInt 3 4 5)  -- Prints "Scalene triangle"; alternative: test with other triangle types
main7 :: IO ()  -- Main for testing
main7 = print (triangleTypeInt 3 3 4)  -- Prints "Isosceles triangle"; alternative: test with other triangle types


-- Function that prints elements of a list that are greater than 5