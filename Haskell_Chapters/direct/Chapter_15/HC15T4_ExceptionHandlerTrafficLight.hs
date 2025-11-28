-- HC15T4_ExceptionHandlerTrafficLight.hs : Exception handler for traffic light exceptions
-- This file catches and handles traffic light exceptions using a handler function.

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

-- Exception handler function
handleTrafficLightException :: TrafficLightException -> IO ()
handleTrafficLightException (TrafficLightException msg) = putStrLn ("Caught exception: " ++ msg)

-- Input wrapper: Gets color from user input and checks it with exception handling.
get_checkTrafficLightSafe :: IO ()
get_checkTrafficLightSafe = do
  putStrLn "Enter traffic light color:"
  color <- getLine
  checkTrafficLight color `catch` handleTrafficLightException

-- Main function: Minimal logic.
main :: IO ()
main = get_checkTrafficLightSafe
