-- HC3T7.hs : Determine season from month
-- This file contains a function to determine the season based on the month using guards.

-- Pure function: Determines the season based on the month using guards.
season :: Int -> String
season m
  | m == 12 || m == 1 || m == 2 = "Winter"
  | m >= 3 && m <= 5 = "Spring"
  | m >= 6 && m <= 8 = "Summer"
  | m >= 9 && m <= 11 = "Autumn"
  | otherwise = "Invalid month"

main :: IO ()
main = do
    putStrLn ("season 3: " ++ season 3)
    putStrLn ("season 7: " ++ season 7)
    putStrLn ("season 11: " ++ season 11)
