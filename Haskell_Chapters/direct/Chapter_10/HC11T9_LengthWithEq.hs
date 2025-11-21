-- HC11T9.hs : Data Type Length with Units
-- This file defines a new data type Length with constructors M and Km, derive Eq, and manually fix comparisons between meters and kilometers.

-- Pure function: Defines the Length data type.
data Length = M Double | Km Double deriving Show

-- Pure function: Implements Eq for Length.
instance Eq Length where
    (M x) == (M y) = x == y
    (Km x) == (Km y) = x == y
    (M x) == (Km y) = x == y * 1000
    (Km x) == (M y) = x * 1000 == y

main :: IO ()
main = do
    let len1 = M 1000
    let len2 = Km 1
    putStrLn ("Equal: " ++ show (len1 == len2))
