-- HC11T7.hs : User Options
-- This file prints options and executes based on choice.

-- Pure function: Processes choice.
processChoice :: String -> String
processChoice "1" = "You chose option 1"
processChoice "2" = "You chose option 2"
processChoice _ = "Invalid choice"

-- Input wrapper: Gets choice and returns result.
get_processChoice :: IO String
get_processChoice = do
    putStrLn "Choose: 1 or 2"
    choice <- getLine
    return (processChoice choice)

main :: IO ()
main = do
    result <- get_processChoice
    putStrLn result
