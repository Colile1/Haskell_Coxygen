-- HC13T4_SumNonEmpty.hs : Uses SumNonEmpty module to sum list with error on empty list
-- Demonstrates importing and using custom module SumNonEmpty

import qualified SumNonEmpty as SN

-- Output logic: print results of sumNonEmpty on example lists
main :: IO ()
main = do
  print (SN.sumNonEmpty [])
  print (SN.sumNonEmpty [1..n])
    where n = 3
