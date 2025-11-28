-- HC15T3_CustomExceptionTrafficLight.hs : Define and throw custom exception for traffic light errors
-- This file defines a custom exception and throws it for invalid traffic light colors.

import Control.Exception
import Data.Typeable

-- Define a custom exception type
data TrafficLightException = TrafficLightException String deriving (Show, Typeable)

instance Exception TrafficLightException

-- Pure function: Checks traffic light color and throws exception if invalid.
checkTrafficLight :: String -> IO ()
checkTrafficLight color
  | color `elem` ["red", "yellow", "green"] = putStrLn ("Traffic light is " ++ color)
  | otherwise = throwIO (TrafficLightException ("Invalid traffic light color: " ++ color))

-- Input wrapper: Gets color from user input and checks it.
get_checkTrafficLight :: IO ()
get_checkTrafficLight = do
  putStrLn "Enter traffic light color:"
  color <- getLine
  checkTrafficLight color

-- Main function: Minimal logic.
main :: IO ()
main = get_checkTrafficLight
