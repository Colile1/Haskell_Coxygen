-- HC19T-all-test.hs : Test Suite
-- This file calls all the tasks 1-20 to test if they work as intended.

import System.Process (callCommand)
import Control.Monad (forM_)

-- Output logic
main :: IO ()
main = do
    putStrLn "--- Starting Full Test Suite (Tasks 1-20) ---"
    
    let tasks = [ "HC19T1.hs", "HC19T2.hs", "HC19T3.hs", "HC19T4.hs", "HC19T5.hs"
                , "HC19T6.hs", "HC19T7.hs", "HC19T8.hs", "HC19T9.hs", "HC19T10.hs"
                , "HC19T11.hs", "HC19T12.hs", "HC19T13.hs", "HC19T14.hs", "HC19T15.hs"
                , "HC19T16.hs", "HC19T17.hs", "HC19T18.hs", "HC19T19.hs", "HC19T20.hs"
                ]
    
    forM_ tasks $ \task -> do
        putStrLn $ "\n>>> Running " ++ task ++ "..."
        callCommand ("runghc " ++ task)
    
    putStrLn "\n--- All Tasks Completed ---"
