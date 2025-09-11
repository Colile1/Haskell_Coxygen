-- HC1T7 - Task 7: Converting Fahrenheit to Celsius
-- This code defines a function fToC that converts a temperature from Fahrenheit to Celsius using the formula (F - 32) * 5/9.

fToC :: Double -> Double  -- Type: takes Fahrenheit Double, returns Celsius Double
fToC f = (f - 32) * 5 / 9  -- Applies conversion formula; alternative: use fractional division or define constants

main :: IO ()  -- Main for testing
main = print (fToC 32.0)  -- Prints 0.0, since 32F is 0C
