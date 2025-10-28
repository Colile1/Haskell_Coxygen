-- HC5T2.hs : Filter odd numbers
-- This file contains a function that filters odd numbers from 1 to 30.

-- Pure function: Filters odd numbers from a list.
getOdds :: [Int]
getOdds = filter odd [1..30]

main :: IO ()
main = do
    putStrLn ("getOdds: " ++ show getOdds)
