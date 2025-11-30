-- HC19T7.hs : Conditional Print
-- This file uses 'when' to print a message only if a condition is true.

import Control.Monad (when)

-- Pure function: conditionalPrint wrapper
-- Takes a boolean and an IO action, executes action if boolean is true.
conditionalPrint :: Bool -> IO () -> IO ()
conditionalPrint = when

-- Output logic
main :: IO ()
main = do
    putStrLn "Testing with True:"
    conditionalPrint True (putStrLn "Hello from Johannesburg!")
    putStrLn "Testing with False (should print nothing):"
    conditionalPrint False (putStrLn "This should not appear.")
