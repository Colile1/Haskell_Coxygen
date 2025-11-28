-- HC15T1_HandleExceptionsFileVelocity.hs : Handle exceptions for file reading and velocity calculation
-- This file reads a file and calculates velocity based on user input while handling exceptions.

import Control.Exception (catch, IOException)
import System.IO (readFile)
import Text.Read (readMaybe)

-- Pure function: Calculates velocity given distance and time.
calculateVelocity :: Double -> Double -> Maybe Double
calculateVelocity _ 0 = Nothing
calculateVelocity distance time = Just (distance / time)

-- Input wrapper: Reads distance and time from user input safely using readMaybe.
get_velocityInputs :: IO (Maybe (Double, Double))
get_velocityInputs = do
  putStrLn "Enter distance (in meters):"
  distStr <- getLine
  putStrLn "Enter time (in seconds):"
  timeStr <- getLine
  let maybeDist = readMaybe distStr :: Maybe Double
      maybeTime = readMaybe timeStr :: Maybe Double
  case (maybeDist, maybeTime) of
    (Just d, Just t) -> return (Just (d, t))
    _ -> return Nothing

-- Input wrapper: Reads file content safely with exception handling.
get_fileContentSafe :: FilePath -> IO (Either IOException String)
get_fileContentSafe filePath = 
  catch (Right <$> readFile filePath) handler
  where
    handler :: IOException -> IO (Either IOException String)
    handler e = return (Left e)

-- Output logic: Displays velocity or error.
print_velocityResult :: Maybe Double -> IO ()
print_velocityResult Nothing = putStrLn "Error: Invalid input or zero time, cannot calculate velocity."
print_velocityResult (Just v) = putStrLn ("Velocity is " ++ show v ++ " meters/second")

-- Main function: Orchestrates file reading and velocity calculation.
main :: IO ()
main = do
  putStrLn "Enter the path of the file to read:"
  filePath <- getLine
  contentResult <- get_fileContentSafe filePath
  case contentResult of
    Left e -> putStrLn $ "Failed to read file: " ++ show e
    Right content -> do
      putStrLn "File content successfully read."
      putStrLn content
      maybeInputs <- get_velocityInputs
      case maybeInputs of
        Nothing -> putStrLn "Invalid numerical input for distance or time."
        Just (d, t) -> print_velocityResult (calculateVelocity d t)
