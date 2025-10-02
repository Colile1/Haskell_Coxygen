-- HC12T7: Calculate Circle Area

calculateCircleArea :: Double -> Double
calculateCircleArea r = pi * r * r

main :: IO ()
main = print (calculateCircleArea 5.0)
