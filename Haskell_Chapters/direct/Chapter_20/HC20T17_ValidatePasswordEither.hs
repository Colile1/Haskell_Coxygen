-- HC20T17.hs : Validate Password Either
-- This file checks password validity using the Either monad to catch the first error.

import Data.Char (isAlphaNum)

-- Pure function: Check length
checkLength :: String -> Either String String
checkLength pwd
    | length pwd >= 8 = Right pwd
    | otherwise       = Left "Password too short (min 8 chars)."

-- Pure function: Check alphanumeric
checkAlpha :: String -> Either String String
checkAlpha pwd
    | all isAlphaNum pwd = Right pwd
    | otherwise          = Left "Password contains invalid characters."

-- Pure function: Validate pipeline
validatePassword :: String -> Either String String
validatePassword pwd = checkLength pwd >>= checkAlpha

-- Output logic: 
main :: IO ()
main = do
    let p1 = "short"
    let p2 = "ValidPass123"
    let p3 = "Invalid@Pass"
    
    putStrLn ("Checking '" ++ p1 ++ "': " ++ show (validatePassword p1))
    putStrLn ("Checking '" ++ p2 ++ "': " ++ show (validatePassword p2))
    putStrLn ("Checking '" ++ p3 ++ "': " ++ show (validatePassword p3))
