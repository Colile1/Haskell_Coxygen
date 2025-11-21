-- HC11T1.hs : Greet the User
-- This file asks for the user's name and prints a greeting.

-- Pure function: Creates a greeting message.
greetUser :: String -> String
greetUser name = "Hello, " ++ name ++ "!"

-- Input wrapper: Gets the name and returns the greeting.
get_greetUser :: IO String
get_greetUser = do
    putStrLn "What is your name?"
    name <- getLine
    return (greetUser name)

main :: IO ()
main = do
    greeting <- get_greetUser
    putStrLn greeting
