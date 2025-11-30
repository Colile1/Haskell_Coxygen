-- HC19T5.hs : Apply Effects IO
-- This file implements applyEffects which sums values from a tuple of IO actions while printing.

import Control.Applicative

-- Pure function: Simple addition
add :: Int -> Int -> Int
add = (+)

-- Pure function: Applies effects using <*> to sum results
applyEffects :: (IO Int, IO Int) -> IO Int
applyEffects (io1, io2) = pure add <*> io1 <*> io2

-- Input wrapper: Simulates an IO action that returns an Int
get_first_int :: IO Int
get_first_int = do
    putStrLn "Getting n1 from Johannesburg..."
    return 10

-- Input wrapper: Simulates a second IO action that returns an Int
get_second_int :: IO Int
get_second_int = do
    putStrLn "Getting n2 from Durban..."
    return 20

-- Output logic
main :: IO ()
main = do
    result <- applyEffects (get_first_int, get_second_int)
    putStrLn ("Sum Result: " ++ show result)
