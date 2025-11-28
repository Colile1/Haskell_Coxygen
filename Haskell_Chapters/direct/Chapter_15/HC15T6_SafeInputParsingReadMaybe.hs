-- HC15T6_SafeInputParsingReadMaybe.hs : Safe input parsing using readMaybe
-- This file demonstrates safe parsing of user input using readMaybe to avoid runtime errors.

import Text.Read (readMaybe)

-- Pure function: Parses a string into an integer safely.
safeParseInt :: String -> Maybe Int
safeParseInt = readMaybe

-- Input wrapper: Gets user input and parses safely.
get_safeParseInt :: IO (Maybe Int)
get_safeParseInt = do
  putStrLn "Enter an integer:"
  input <- getLine
  return (safeParseInt input)

-- Output logic: Prints parsed integer or error message.
print_safeParseIntResult :: Maybe Int -> IO ()
print_safeParseIntResult Nothing = putStrLn "Error: Invalid integer input."
print_safeParseIntResult (Just n) = putStrLn ("Parsed integer: " ++ show n)

-- Main function: Minimal logic.
main :: IO ()
main = do
  maybeInt <- get_safeParseInt
  print_safeParseIntResult maybeInt
