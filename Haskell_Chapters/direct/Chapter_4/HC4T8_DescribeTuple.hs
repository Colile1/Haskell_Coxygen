-- HC4T8.hs : Describe tuple
-- This file contains a function that extracts values from a tuple and returns a string.

-- Pure function: Describes the elements of a 3-tuple.
describeTuple :: Show a => (a, a, a) -> String
describeTuple (x, y, z) = "First: " ++ show x ++ ", Second: " ++ show y ++ ", Third: " ++ show z

main :: IO ()
main = do
    putStrLn ("describeTuple (1, 2, 3): " ++ describeTuple (1, 2, 3))
    putStrLn ("describeTuple (\"a\", \"b\", \"c\"): " ++ describeTuple ("a", "b", "c"))
