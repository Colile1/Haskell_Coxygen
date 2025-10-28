-- HC1T2 Task 2: Pure Function Example
-- Function : Area of circle given radius
circleArea :: Double -> Double
circleArea r = pi * r * r

main :: IO ()
main = print (circleArea 12.0)
