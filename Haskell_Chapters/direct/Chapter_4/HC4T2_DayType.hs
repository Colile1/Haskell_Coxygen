-- HC4T2.hs : Day type
-- This file contains a function to determine if a day is weekday or weekend.

-- Pure function: Determines if day is weekday or weekend.
dayType :: String -> String
dayType "Saturday" = "It's a weekend!"
dayType "Sunday" = "It's a weekend!"
dayType "Monday" = "It's a weekday."
dayType "Tuesday" = "It's a weekday."
dayType "Wednesday" = "It's a weekday."
dayType "Thursday" = "It's a weekday."
dayType "Friday" = "It's a weekday."
dayType _ = "Invalid day"

main :: IO ()
main = do
    putStrLn ("dayType \"Monday\": " ++ dayType "Monday")
    putStrLn ("dayType \"Saturday\": " ++ dayType "Saturday")
    putStrLn ("dayType \"Funday\": " ++ dayType "Funday")
