-- 1.hs
-- A simple program to parse a list of email addresses

import Data.List (isInfixOf)

newtype Email = Email String deriving Show

parseEmails :: [String] -> [Email]
parseEmails strs = [Email s | s <- strs, "@" `isInfixOf` s]

main :: IO ()
main = do
    putStrLn "Enter email addresses separated by spaces:"
    line <- getLine
    let wordsList = words line
    let emails = parseEmails wordsList
    if null emails
       then putStrLn "No valid emails found."
       else do
           putStrLn "Valid emails parsed:"
           print emails
