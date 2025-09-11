-- HC1T6 - Task 6: Using Type Signatures
-- This code defines a function addNumbers with an explicit type signature that takes two integers and returns their sum.

addNumbers :: Int -> Int -> Int  -- Type signature: takes two Ints, returns Int
addNumbers x y = x + y  -- Adds x and y; alternative: use (+) x y

main :: IO ()  -- Main for testing
main = print (addNumbers 3 4)  -- Prints 7
