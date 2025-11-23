-- HC13T5_RestrictedExport.hs : Demonstrates usage of SumNonEmptyRestricted module with restricted exports

import SumNonEmptyRestricted

-- Output logic: print result of sumNonEmpty on example lists
main :: IO ()
main = do
  print (sumNonEmpty [])
  print (sumNonEmpty [1..n])
  where n = 4
