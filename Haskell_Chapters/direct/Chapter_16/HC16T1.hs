-- HC16T1: Reverse a String
--Define a function to reverse a string.

reverseString :: String -> String
reverseString = reverse

main :: IO ()
main = do
    putStrLn "Enter a string to reverse:"
    input <- getLine
    let reversed = reverseString input
    putStrLn $ "Reversed string: " ++ reversed