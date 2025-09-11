-- HC1T8 - Task 8: Higher-Order Functions
-- This code defines a function applyTwice that takes a function and applies it twice to an input value.

applyTwice :: (a -> a) -> a -> a  -- Type: takes a function from a to a, and a value of type a, returns a value of type a
applyTwice f x = f (f x)  -- Applies f to x, then applies f again to the result; alternative: use function composition f . f $ x

main :: IO ()  -- Main for testing
main = print (applyTwice (+3) 10)  -- Applies (+3) twice to 10, expected output: 16
