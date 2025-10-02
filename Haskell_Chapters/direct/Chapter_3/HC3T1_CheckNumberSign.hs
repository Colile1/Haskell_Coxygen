-- HC3T1.hs : Check number sign
-- This file contains a function to check if a number is positive, negative, or zero.

-- Pure function: Checks if a number is positive, negative, or zero using if-then-else.
checkNumber :: Int -> String
checkNumber n = if n > 0 then "Positive"
                else if n < 0 then "Negative"
                else "Zero"

main :: IO ()
main = do
    putStrLn ("checkNumber 5: " ++ checkNumber 5)
    putStrLn ("checkNumber (-3): " ++ checkNumber (-3))
    putStrLn ("checkNumber 0: " ++ checkNumber 0)
