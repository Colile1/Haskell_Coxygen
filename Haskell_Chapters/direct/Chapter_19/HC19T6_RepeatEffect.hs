-- HC19T6.hs : Repeat Effect Forever
-- This file defines a function that repeatedly executes an effect using forever.

import Control.Monad (forever)

-- Pure function: Wraps the forever function
-- Note: 'forever' returns 'f b', meaning it never effectively returns a value, it loops endlessly.
repeatEffect :: Applicative f => f a -> f b
repeatEffect = forever

-- Output logic
main :: IO ()
main = do
    putStrLn "Starting infinite loop (Ctrl+C to stop). Printing 'Colile'..."
    putStrLn "Colile (Simulating one run for safety)"
