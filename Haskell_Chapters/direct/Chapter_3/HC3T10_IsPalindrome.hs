-- HC3T10.hs : Check palindrome
-- This file contains a function to check if a string is a palindrome using recursion and guards.

-- Pure function: Checks if a string is a palindrome using recursion and guards.
isPalindrome :: String -> Bool
isPalindrome s
  | length s <= 1 = True
  | head s == last s = isPalindrome (init (tail s))
  | otherwise = False

main :: IO ()
main = do
    putStrLn ("isPalindrome \"racecar\": " ++ show (isPalindrome "racecar"))
    putStrLn ("isPalindrome \"haskell\": " ++ show (isPalindrome "haskell"))
    putStrLn ("isPalindrome \"madam\": " ++ show (isPalindrome "madam"))
