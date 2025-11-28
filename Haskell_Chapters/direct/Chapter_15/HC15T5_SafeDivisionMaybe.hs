-- HC15T5_SafeDivisionMaybe.hs : Safe division using Maybe to avoid divide-by-zero errors
-- This file implements a safe division function that returns Nothing if the divisor is zero.

import Text.Read (readMaybe)

-- Pure function: Performs safe division returning Maybe Double.
safeDivide :: Double -> Double -> Maybe Double
safeDivide _ 0 = Nothing
safeDivide numerator denominator = Just (numerator / denominator)

-- Input wrapper: Gets numerator and denominator from user input safely.
get_safeDivide :: IO (Maybe (Double, Double))
get_safeDivide = do
  putStrLn "Enter numerator:"
  numStr <- getLine
  putStrLn "Enter denominator:"
  denomStr <- getLine
  let maybeNum = readMaybe numStr :: Maybe Double
      maybeDenom = readMaybe denomStr :: Maybe Double
  case (maybeNum, maybeDenom) of
    (Just n, Just d) -> return (Just (n, d))
    _ -> return Nothing

-- Output logic: Prints the division result or error message.
print_safeDivideResult :: Maybe Double -> IO ()
print_safeDivideResult Nothing = putStrLn "Error: Division by zero or invalid input."
print_safeDivideResult (Just result) = putStrLn ("Result: " ++ show result)

-- main function: Minimal logic.
main :: IO ()
main = do
  maybeInputs <- get_safeDivide
  case maybeInputs of
    Nothing -> putStrLn "Invalid numerical input."
    Just (n, d) -> print_safeDivideResult (safeDivide n d)
