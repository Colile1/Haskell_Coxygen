-- HC18T10: nestedFmap Function
-- Create a function nestedFmap that applies a function to a nested structure using multiple fmap calls.

nestedFmap :: (a -> b) -> [[a]] -> [[b]]
nestedFmap f = fmap (fmap f)

main :: IO ()
main = do
    print (nestedFmap (+1) [[1, 2], [3, 4]])  -- [[2,3],[4,5]]
