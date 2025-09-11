-- HC10T2 - Task 2: Summable Type Class
-- This code creates a type class Summable that provides sumUp :: [a] -> a for summing lists, and implements it for Int.

class Summable a where  -- Defines type class Summable; alternative: use Num class which has sum
    sumUp :: [a] -> a  -- Method to sum a list; alternative: use foldl (+) 0

instance Summable Int where  -- Instance for Int; alternative: use Num instance
    sumUp [] = 0  -- Base case for empty list; alternative: use error for empty
    sumUp (x:xs) = x + sumUp xs  -- Recursive sum; alternative: use foldr (+) 0

main :: IO ()  -- Main for testing
main = print (sumUp [1,2,3,4])  -- Prints 10; alternative: test with empty list
