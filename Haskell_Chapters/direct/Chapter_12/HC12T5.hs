-- HC12T5: Palindrome Checker

isPalindrome :: String -> Bool
isPalindrome s = s == reverse s

main :: IO ()
main = do
  putStrLn "Enter a string:"
  s <- getLine
  print (isPalindrome s)
