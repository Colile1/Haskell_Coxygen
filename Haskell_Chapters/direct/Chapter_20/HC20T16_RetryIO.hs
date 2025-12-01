{-# LANGUAGE TypeApplications #-}

-- HC20T16.hs : Retry IO
-- This file implements a function that retries an IO operation a specified number of times.

import Control.Exception (try, IOException)

-- Pure function: Retries an IO action n times upon failure
retryIO :: Int -> IO a -> IO (Either String a)
retryIO 0 _ = return (Left "Max retries reached")
retryIO n action = do
    result <- try @IOException action
    case result of
        Left _ -> do
            putStrLn ("Retrying... " ++ show (n-1) ++ " attempts left.")
            retryIO (n-1) action
        Right val -> return (Right val)

-- Input wrapper: A function that simulates failure occasionally
-- For this test, we make it succeed immediately to keep output clean, but the logic supports failure.
unstableAction :: IO String
unstableAction = return "Success Data from Cape Town"

-- Output logic: 
main :: IO ()
main = do
    result <- retryIO 3 unstableAction
    case result of
        Left err -> putStrLn ("Failed: " ++ err)
        Right val -> putStrLn ("Operation Successful: " ++ val)
