-- HC20T12.hs : File Reading IO
-- This file reads a file using the IO Monad and displays contents.

import System.IO

-- Output logic: 
main :: IO ()
main = do
    -- Create a dummy file for the test
    writeFile "test_chapter20.txt" "Line 1: Hello\nLine 2: From\nLine 3: Durban"
    
    putStrLn "Reading file 'test_chapter20.txt':"
    contents <- readFile "test_chapter20.txt"
    let linesOfFile = lines contents
    
    -- mapM_ sequences the IO actions in the list
    mapM_ putStrLn linesOfFile
