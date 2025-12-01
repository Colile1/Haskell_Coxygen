-- HC20T4.hs : Count Chars State
-- This file counts occurrences of a specific character using the State monad.

import Control.Monad.State

-- Pure function: Updates state if character matches
countCharStep :: Char -> Char -> State Int ()
countCharStep target current = do
    count <- get
    if target == current
        then put (count + 1)
        else return ()

-- Pure function: Runs the count over a string
countChars :: Char -> String -> State Int ()
countChars target str = mapM_ (countCharStep target) str

-- Output logic: 
main :: IO ()
main = do
    let text = "Hello Johannesburg"
    let target = 'o'
    let (_, finalCount) = runState (countChars target text) 0
    putStrLn ("Text: " ++ text)
    putStrLn ("Occurrences of '" ++ [target] ++ "': " ++ show finalCount)
