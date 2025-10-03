-- HC5T8.hs : Add five point-free
-- This file contains the addFive function in point-free style.

-- Pure function: Adds 5 in point-free style.
addFive :: Int -> Int
addFive = (+5)

main :: IO ()
main = do
    putStrLn ("addFive 3: " ++ show (addFive 3))
    putStrLn ("addFive 10: " ++ show (addFive 10))
