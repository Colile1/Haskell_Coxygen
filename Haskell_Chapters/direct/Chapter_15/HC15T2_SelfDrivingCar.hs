-- HC15T2_SelfDrivingCar.hs : Basic self-driving AI car system reacting to traffic light colors
-- This file implements a system that reacts to traffic light colors.

-- Pure function: Returns the action based on the traffic light color.
carAction :: String -> String
carAction color
  | color == "red" = "Stop"
  | color == "yellow" = "Ready"
  | color == "green" = "Go"
  | otherwise = "Unknown color, proceed with caution"

-- Input wrapper: Gets the traffic light color from user input.
get_carAction :: IO String
get_carAction = do
  putStrLn "Enter the traffic light color (red, yellow, green):"
  color <- getLine
  return (carAction color)

-- Output logic: Prints the car's action.
print_carAction :: String -> IO ()
print_carAction action = putStrLn ("Car action: " ++ action)

-- Main function: Minimal logic, orchestrates input and output.
main :: IO ()
main = do
  action <- get_carAction
  print_carAction action
