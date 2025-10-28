-- HC8T2.hs : New Types and Data Constructors
-- This file defines PaymentMethod and Person types and creates a person bob.

data PaymentMethod = Cash | Card | Cryptocurrency

data Person = Person String (String, Int) PaymentMethod

bob :: Person
bob = Person "Bob" ("Johannesburg", 12345) Cash

get_personName :: Person -> String
get_personName (Person name _ _) = name

main :: IO ()
main = do
    putStrLn "Person name: "
    putStrLn (get_personName bob)
