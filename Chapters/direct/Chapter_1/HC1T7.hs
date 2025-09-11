-- HC1T7
fToC :: Double -> Double
fToC f = (f - 32) * 5 / 9

main :: IO ()
main = print (fToC 32.0)
