-- HC19T13.hs : When Applicative
-- This file implements a function that executes an action conditionally when a Bool is true.

import Control.Applicative

-- Pure function: Custom implementation of 'when' for Applicatives
whenApplicative :: Applicative f => Bool -> f () -> f ()
whenApplicative condition action = 
    if condition then action else pure ()

-- Output logic
main :: IO ()
main = do
    putStrLn "Testing custom whenApplicative:"
    whenApplicative True (putStrLn "Colile authorized access.")
    whenApplicative False (putStrLn "This should be hidden.")
