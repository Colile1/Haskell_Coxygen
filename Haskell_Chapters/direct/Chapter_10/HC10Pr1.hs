-- HC10Pr1.hs : Password Checker
-- This file implements a password verification program that prompts the user until the correct password is entered.

--stored password.
store :: String
store = "password"

-- Pure function: checks if the input matches the stored password.
check :: String -> Bool
check input = input == store

-- Input wrapper: gathers passwords from user
get_check :: IO Bool
get_check = do
    putStrLn "Enter password:"
    input <- getLine
    return (check input)

main :: IO ()
main = do
    correct <- get_check
    if correct
        then putStrLn "password is correct"
        else main

