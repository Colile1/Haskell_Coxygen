-- HC15T10_HybridErrorHandling.hs : Velocity program with hybrid error handling using Either and IO exceptions
-- This file demonstrates a velocity program handling errors with Either and IO exceptions.

import Control.Exception (IOException, try)
import Text.Read (readMaybe)
import System.IO (readFile)

-- Pure function: Performs safe division using Either to handle divide-by-zero.
safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "Error: Division by zero"
safeDivide numerator denominator = Right (numerator / denominator)

-- Function to read distance from a file safely using try.
readDistanceFromFile :: FilePath -> IO (Either IOException String)
readDistanceFromFile = try . readFile

-- Input wrapper: Parse distance and time strings safely using readMaybe.
parseInputs :: String -> String -> Either String (Double, Double)
parseInputs distStr timeStr =
  case (readMaybe distStr, readMaybe timeStr) of
    (Just d, Just t) -> Right (d, t)
    _ -> Left "Error: Invalid numeric input"

-- Output logic: Prints velocity or error message.
printResult :: Either String Double -> IO ()
printResult (Left err) = putStrLn err
printResult (Right v) = putStrLn ("Velocity is " ++ show v ++ " meters/second")

-- Main function: Minimal logic.
main :: IO ()
main = do
  putStrLn "Enter file path containing distance:"
  filePath <- getLine
  distanceResult <- readDistanceFromFile filePath
  case distanceResult of
    Left e -> putStrLn ("File read error: " ++ show e)
    Right distStr -> do
      putStrLn "Enter time (seconds):"
      timeStr <- getLine
      case parseInputs distStr timeStr of
        Left err -> putStrLn err
        Right (d, t) -> printResult (safeDivide d t)
