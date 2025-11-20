--HC18T1: mapToLower Function with fmap
--Define a function mapToLower using fmap that converts all characters in a list to lowercase.

import Data.Char (toLower)

mapToLower :: String -> String
mapToLower = fmap toLower

main :: IO ()
main = do
    print (mapToLower "Hello HASKELL")