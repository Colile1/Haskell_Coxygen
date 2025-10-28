-- HC5T7.hs : Using $ operator
-- This file contains a function rewritten using the $ operator.

-- Pure function: Uses $ operator to simplify function application.
result :: Int
result = sum $ map (*2) $ filter (>3) [1..10]

main :: IO ()
main = do
    putStrLn ("result: " ++ show result)
