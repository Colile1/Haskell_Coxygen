-- HC5T4.hs : Bigger than 10 with lambda
-- This file contains the biggerThan10 function rewritten using a lambda.

-- Pure function: Checks if a number is bigger than 10 using lambda.
biggerThan10 :: Int -> Bool
biggerThan10 = \x -> x > 10

main :: IO ()
main = do
    putStrLn ("biggerThan10 15: " ++ show (biggerThan10 15))
    putStrLn ("biggerThan10 5: " ++ show (biggerThan10 5))
