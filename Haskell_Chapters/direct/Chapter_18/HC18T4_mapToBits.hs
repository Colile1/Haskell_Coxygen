-- HC18T4: mapToBits Function
-- Implement a function mapToBits to convert a list of Booleans to characters '1' or '0' using fmap.

mapToBits :: [Bool] -> String
mapToBits = fmap (\b -> if b then '1' else '0')

main :: IO ()
main = do
    print (mapToBits [True, False, True, False])
