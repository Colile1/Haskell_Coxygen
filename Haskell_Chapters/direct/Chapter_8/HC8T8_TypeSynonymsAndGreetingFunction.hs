-- HC8T8.hs : Type Synonyms and Greeting Function
-- This file creates type synonyms and a greeting function.

type Name = String
type Greeting = String

greet :: Name -> Greeting
greet name = "Hello, " ++ name ++ "!"

get_greet :: IO Greeting
get_greet = do
    putStrLn "Enter name:"
    name <- getLine
    return (greet name)

main :: IO ()
main = do
    greeting <- get_greet
    putStrLn "Greeting: "
    putStrLn greeting
