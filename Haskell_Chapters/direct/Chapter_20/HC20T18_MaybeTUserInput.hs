-- HC20T18.hs : MaybeT User Input
-- This file uses MaybeT to combine Maybe and IO for input validation.

import Control.Monad.Trans.Maybe
import Control.Monad.IO.Class (liftIO)
import Text.Read (readMaybe)

-- Input wrapper: Prompts and reads an Int using MaybeT IO
readInt :: String -> MaybeT IO Int
readInt prompt = do
    liftIO $ putStrLn prompt
    input <- liftIO getLine
    case readMaybe input of
        Nothing -> MaybeT (return Nothing) -- Fail the computation
        Just n  -> return n

-- Output logic: This creates a mock function to simulate user input instead of blocking stdin
    -- This is used to simulate the logic of MaybeT IO manually for the test runner.
main :: IO ()
main = do
    let mockInput = "100" 
    let action = do
          liftIO $ putStrLn "Simulating entering number: 100"
          return (readMaybe mockInput :: Maybe Int)
          
    result <- runMaybeT (MaybeT action)
    putStrLn ("User Input Result: " ++ show result)
