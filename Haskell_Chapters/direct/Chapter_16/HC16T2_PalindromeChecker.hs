-- HC16T2: Palindrome Checker
-- Define a function that checks if a given string is a palindrome.

isPalindrome :: String -> Bool
isPalindrome str = str == reverse str

main :: IO ()
main = do
    putStrLn "Enter a string to check if it's a palindrome:"
    input <- getLine
    if isPalindrome input
        then putStrLn "The string is a palindrome."
        else putStrLn "The string is not a palindrome."
