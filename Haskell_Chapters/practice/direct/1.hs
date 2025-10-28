-- HC3T2_TemperatureConversion.hs : Dual temperature conversion
-- This file demonstrates converting between Celsius and Fahrenheit using separate conversion functions.

-- Pure functions
celsiusToFahrenheit :: Float -> Float
celsiusToFahrenheit n = (n * (9 / 5)) + 32

fahrenheitToCelsius :: Float -> Float
fahrenheitToCelsius n = (n - 32) * (5 / 9)

convertTemperature :: Int -> Float -> Float
convertTemperature choice n
    | choice == 1 = celsiusToFahrenheit n
    | choice == 2 = fahrenheitToCelsius n
    | otherwise = error "Invalid choice"

-- Input wrapper
get_convertTemperature :: IO Float
get_convertTemperature = do
    putStrLn "Type 1 to convert from Celsius to Fahrenheit"
    putStrLn "Type 2 to convert from Fahrenheit to Celsius"
    choiceInput <- getLine
    let choice = read choiceInput :: Int
    putStrLn "Enter temperature value:"
    tempInput <- getLine
    let n = read tempInput :: Float
    return (convertTemperature choice n)

main :: IO ()
main = do
    result <- get_convertTemperature
    putStrLn "Converted temperature:"
    print result
