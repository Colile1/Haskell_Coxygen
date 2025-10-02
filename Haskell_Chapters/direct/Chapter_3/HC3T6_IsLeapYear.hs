-- HC3T6.hs : Check leap year
-- This file contains a function to check if a year is a leap year using if-then-else.

-- Pure function: Checks if a year is a leap year using if-then-else.
isLeapYear :: Int -> Bool
isLeapYear year = if year `mod` 400 == 0 then True
                  else if year `mod` 100 == 0 then False
                  else if year `mod` 4 == 0 then True
                  else False

main :: IO ()
main = do
    putStrLn ("isLeapYear 2000: " ++ show (isLeapYear 2000))
    putStrLn ("isLeapYear 1900: " ++ show (isLeapYear 1900))
    putStrLn ("isLeapYear 2024: " ++ show (isLeapYear 2024))
