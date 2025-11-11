-- HC9T2.hs : Parametric Data Type Box
-- This file implements a parametric data type Box a with Empty and Has a constructors.

-- Pure function: Defines the Box data type.
data Box a = Empty | Has a

main :: IO ()
main = do
    let emptyBox = Empty :: Box Int
    let fullBox = Has 42 :: Box Int
    putStrLn ("Empty box: " ++ show emptyBox)
    putStrLn ("Full box: " ++ show fullBox)
