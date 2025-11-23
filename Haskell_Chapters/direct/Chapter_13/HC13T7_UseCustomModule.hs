-- HC13T7_UseCustomModule.hs : Import and use SumNonEmpty module to calculate sum

import SumNonEmpty

-- Output logic: print sumNonEmpty results for example list
main :: IO ()
main = do
  let colileList = [1..n]
      n = 5
  print (sumNonEmpty colileList)
