-- HC19T10.hs : Combine Results Either
-- This file combines two Either values using applicative style.

import Control.Applicative

-- Pure function: Combines two strings
combineStrings :: String -> String -> String
combineStrings s1 s2 = s1 ++ " " ++ s2

-- Pure function: Lifts combination to Either context
combineResults :: Either String String -> Either String String -> Either String String
combineResults e1 e2 = liftA2 combineStrings e1 e2

-- Input wrapper: Returns Either values
get_eithers :: IO (Either String String, Either String String)
get_eithers = do
    return (Right "Hello", Right "Colile")

-- Output logic
main :: IO ()
main = do
    (e1, e2) <- get_eithers
    let result = combineResults e1 e2
    putStrLn ("Combined Result: " ++ show result)
