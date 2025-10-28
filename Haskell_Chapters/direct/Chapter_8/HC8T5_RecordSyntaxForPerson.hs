-- HC8T5.hs : Record Syntax for Person
-- This file defines Person type using record syntax and creates two persons.

data Person = Person { name :: String, age :: Int, isEmployed :: Bool }

person1 :: Person
person1 = Person { name = "Alice", age = 30, isEmployed = True }

person2 :: Person
person2 = Person { name = "Bob", age = 25, isEmployed = False }

main :: IO ()
main = do
    putStrLn "Person1: "
    putStrLn (show person1)
    putStrLn "Person2: "
    putStrLn (show person2)
