-- HC9T4.hs : Extract Value from Box
-- This file creates a function to extract a value from a Box or return a default.

-- Pure function: Extracts the value from the box or returns the default.
extract :: a -> Box a -> a
extract def Empty = def
extract _ (Has x) = x

main :: IO ()
main = do
    let emptyBox = Empty :: Box Int
    let fullBox = Has 42 :: Box Int
    putStrLn ("Extract from empty: " ++ show (extract 0 emptyBox))
    putStrLn ("Extract from full: " ++ show (extract 0 fullBox))
