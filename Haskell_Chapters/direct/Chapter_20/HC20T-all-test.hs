-- HC20T-all-test.hs : Test Suite
-- This file calls all the tasks 1-20 to test if they work as intended.

import System.Process (callCommand)
import Control.Monad (forM_)

-- Output logic: 
main :: IO ()
main = do
    putStrLn "--- Starting Full Test Suite Chapter 20 (Tasks 1-20) ---"
    
    let tasks = [ "HC20T1*.hs", "HC20T2*.hs", "HC20T3*.hs", "HC20T4*.hs", "HC20T5*.hs"
                , "HC20T6*.hs", "HC20T7*.hs", "HC20T8*.hs", "HC20T9*.hs", "HC20T10*.hs"
                , "HC20T11*.hs", "HC20T12*.hs", "HC20T13*.hs", "HC20T14*.hs", "HC20T15*.hs"
                , "HC20T16*.hs", "HC20T17*.hs", "HC20T18*.hs", "HC20T19*.hs", "HC20T20*.hs"
                ]
    
    forM_ tasks $ \task -> do
        putStrLn $ "\n>>> Running " ++ task ++ "..."
        callCommand ("runghc " ++ task)
    
    putStrLn "\n--- All Tasks Completed ---"
