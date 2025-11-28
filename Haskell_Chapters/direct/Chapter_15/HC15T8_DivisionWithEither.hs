-- HC15T8_DivisionWithEither.hs : Division with Either for detailed errors
-- This file defines a division function using Either to provide detailed error messages.
import Text.Read (readMaybe)

-- Pure function: Performs division with detailed error messages using Either.
safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "Error: Division by zero"
safeDivide numerator denominator = Right (numerator / denominator)

-- Input wrapper: Gets numerator and denominator as input and attempts to divide.
get_safeDivide :: IO ()
get_safeDivide = do
  putStrLn "Enter numerator:"
  numStr <- getLine
  putStrLn "Enter denominator:"
  denomStr <- getLine
  let maybeNum = readMaybe numStr :: Maybe Double
      maybeDenom = readMaybe denomStr :: Maybe Double
  case (maybeNum, maybeDenom) of
    (Just n, Just d) -> case safeDivide n d of
                         Left err -> putStrLn err
                         Right result -> putStrLn ("Result: " ++ show result)
    _ -> putStrLn "Error: Invalid numerical input"

-- Main function: Minimal logic.
main :: IO ()
main = get_safeDivide
