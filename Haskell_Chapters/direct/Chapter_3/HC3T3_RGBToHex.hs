-- HC3T3.hs : Convert RGB to hex
-- This file contains a function to convert an RGB color to a hex string using let bindings.

import Numeric (showHex)

-- Pure function: Converts RGB tuple to hex string using let bindings.
rgbToHex :: (Int, Int, Int) -> String
rgbToHex (r, g, b) = let rHex = toHex r
                         gHex = toHex g
                         bHex = toHex b
                     in rHex ++ gHex ++ bHex
  where toHex n = let h = showHex n ""
                  in if length h == 1 then "0" ++ h else h

main :: IO ()
main = do
    putStrLn ("rgbToHex (255, 0, 127): " ++ rgbToHex (255, 0, 127))
    putStrLn ("rgbToHex (0, 255, 64): " ++ rgbToHex (0, 255, 64))
