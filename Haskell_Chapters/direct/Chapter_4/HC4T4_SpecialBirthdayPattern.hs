-- HC4T4.hs : Special birthday with pattern matching
-- This file contains the specialBirthday function rewritten using pattern matching.

-- Pure function: Returns special message for certain ages using pattern matching.
specialBirthday :: Int -> String
specialBirthday 1 = "First birthday!"
specialBirthday 18 = "You're an adult!"
specialBirthday 60 = "finally, I can stop caring about new lingo!"
specialBirthday _ = "Nothing special"

main :: IO ()
main = do
    putStrLn ("specialBirthday 1: " ++ specialBirthday 1)
    putStrLn ("specialBirthday 18: " ++ specialBirthday 18)
    putStrLn ("specialBirthday 60: " ++ specialBirthday 60)
    putStrLn ("specialBirthday 25: " ++ specialBirthday 25)
