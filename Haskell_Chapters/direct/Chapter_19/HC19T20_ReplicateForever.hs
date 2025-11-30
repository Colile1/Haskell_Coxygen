-- HC19T20.hs : Replicate Forever
-- This file applies an IO action infinitely using forever.

import Control.Monad (forever)

-- Pure function: Wraps forever for IO
replicateForever :: IO a -> IO b
replicateForever = forever

-- Output logic
main :: IO ()
main = do
    putStrLn "Starting infinite replication loop..."
    -- Safe demonstration:
    putStrLn "Loop active (Simulated stop for safety)"
