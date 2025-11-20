-- HC9T2.hs : Parametric Data Type Box
-- This file implements a parametric data type Box a with Empty and Has a constructors.

-- Pure function: Defines the Box data type.
data Box a = Empty | Has a

-- Pure function: Defines the Show instance for Box.
instance Show a => Show (Box a) where
    show Empty = "Empty"
    show (Has x) = "Has " ++ show x

main :: IO ()
main = do
    let emptyBox = Empty :: Box Int
    let fullBox = Has 42 :: Box Int
    putStrLn ("Empty box: " ++ show emptyBox)
    putStrLn ("Full box: " ++ show fullBox)
