-- HC9T3.hs : Add Values in Box
-- This file creates a function to add a number to a Box containing a number.

-- Pure function: Adds n to the value in the box if it contains a number.
addN :: Num a => a -> Box a -> Box a
addN _ Empty = Empty
addN n (Has x) = Has (x + n)

main :: IO ()
main = do
    let box = Has 10 :: Box Int
    let result = addN 5 box
    putStrLn ("Result: " ++ show result)
