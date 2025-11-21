-- HC10T10.hs : Concatenatable Type Class
-- This file defines a Concatenatable type class and implements it for String.

-- Pure function: Defines the Concatenatable type class.
class Concatenatable a where
    concatWith :: a -> a -> a

-- Pure function: Implements Concatenatable for String.
instance Concatenatable String where
    concatWith = (++)

main :: IO ()
main = do
    let str1 = "Hello"
    let str2 = "World"
    putStrLn ("Concatenated: " ++ concatWith str1 str2)
