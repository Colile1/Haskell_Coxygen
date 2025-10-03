-- HC5T5.hs : Multiply by five
-- This file contains a function that multiplies by 5 using partial application.

-- Pure function: Multiplies a number by 5.
multiplyByFive :: Int -> Int
multiplyByFive = (*5)

main :: IO ()
main = do
    putStrLn ("multiplyByFive 3: " ++ show (multiplyByFive 3))
    putStrLn ("multiplyByFive 10: " ++ show (multiplyByFive 10))
