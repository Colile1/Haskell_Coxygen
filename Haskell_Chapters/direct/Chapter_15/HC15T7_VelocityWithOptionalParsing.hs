-- HC15T7_VelocityWithOptionalParsing.hs : Velocity calculation with optional values and parsing handling
-- This program calculates velocity using optional inputs and handles parsing errors safely.

import Text.Read (readMaybe)

-- Pure function: Calculates velocity from distance and time safely.
calculateVelocity :: Double -> Double -> Maybe Double
calculateVelocity _ 0 = Nothing
calculateVelocity distance time = Just (distance / time)

-- Input wrapper: Get distance and time as strings and parse them safely.
get_velocityInputs :: IO (Maybe (Double, Double))
get_velocityInputs = do
  putStrLn "Enter distance (meters):"
  distStr <- getLine
  putStrLn "Enter time (seconds):"
  timeStr <- getLine
  let maybeDist = readMaybe distStr :: Maybe Double
      maybeTime = readMaybe timeStr :: Maybe Double
  case (maybeDist, maybeTime) of
    (Just d, Just t) -> return (Just (d, t))
    _ -> return Nothing

-- Output logic: Display velocity or error.
print_velocityResult :: Maybe Double -> IO ()
print_velocityResult Nothing = putStrLn "Error: Invalid input or divide by zero."
print_velocityResult (Just v) = putStrLn ("Velocity: " ++ show v ++ " m/s")

-- Main function with minimal logic.
main :: IO ()
main = do
  maybeInputs <- get_velocityInputs
  case maybeInputs of
    Nothing -> putStrLn "Invalid input for distance or time."
    Just (d, t) -> print_velocityResult (calculateVelocity d t)
