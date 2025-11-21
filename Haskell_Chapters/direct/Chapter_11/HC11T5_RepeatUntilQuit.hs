-- HC11T5.hs : Repeat Until "quit"
-- This file repeatedly asks for input until "quit".

-- Pure function: Processes input.
processInput :: String -> String
processInput "quit" = "Exiting"
processInput input = "You said: " ++ input

-- Input wrapper: Loops until quit.
get_processInput :: IO ()
get_processInput = do
    putStrLn "Enter input (type 'quit' to exit):"
    input <- getLine
    putStrLn (processInput input)
    if input /= "quit" then get_processInput else return ()

main :: IO ()
main = get_processInput
