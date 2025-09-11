-- HC1T2 - Task 2: Pure Function Example
-- This code defines a pure function circleArea that calculates the area of a circle given the radius, using the formula pi * r^2.

circleArea :: Double -> Double  -- Type signature: takes a Double (radius), returns a Double (area)
circleArea r = pi * r * r  -- Computes area using pi and r squared; alternative: use r ** 2 for exponentiation

main :: IO ()  -- Main IO action for testing
main = print (circleArea 3.0)  -- Prints the area for radius 3.0; expected output: approximately 28.274333882308138
