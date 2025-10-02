-- HC3T9.hs : Find max of three numbers
-- This file contains a function to find the maximum of three numbers using let bindings.

-- Pure function: Finds the maximum of three numbers using let bindings.
maxOfThree :: Int -> Int -> Int -> Int
maxOfThree x y z = let maxXY = if x > y then x else y
                   in if maxXY > z then maxXY else z

main :: IO ()
main = do
    putStrLn ("maxOfThree 10 20 15: " ++ show (maxOfThree 10 20 15))
    putStrLn ("maxOfThree 5 25 10: " ++ show (maxOfThree 5 25 10))
