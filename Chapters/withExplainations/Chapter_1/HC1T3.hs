-- HC1T3 - Task 3: Checking if a Number is Greater than 18
-- This code defines a function greaterThan18 that checks if a given number is greater than 18.

greaterThan18 :: Int -> Bool  -- Type signature: takes an Int, returns a Bool
greaterThan18 x = x > 18  -- Returns True if x is greater than 18, otherwise False

main :: IO ()  -- Main IO action for testing
main = print (greaterThan18 20)  -- Prints True because 20 > 18
