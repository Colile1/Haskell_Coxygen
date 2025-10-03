-- HC4T5.hs : Special birthday with age in message
-- This file contains the modified specialBirthday function that includes age in the catch-all message.

-- Pure function: Returns special message for certain ages, including age in catch-all.
specialBirthday :: Int -> String
specialBirthday 1 = "First birthday!"
specialBirthday 18 = "You're an adult!"
specialBirthday 60 = "finally, I can stop caring about new lingo!"
specialBirthday age = "Nothing special, you're just " ++ show age

main :: IO ()
main = do
    putStrLn ("specialBirthday 1: " ++ specialBirthday 1)
    putStrLn ("specialBirthday 18: " ++ specialBirthday 18)
    putStrLn ("specialBirthday 60: " ++ specialBirthday 60)
    putStrLn ("specialBirthday 25: " ++ specialBirthday 25)
