-- HC19T12.hs : Sum Three Either
-- This file adds three Either String Int values using applicative style.

import Control.Applicative

-- Pure function: Sums three integers
sumThree :: Int -> Int -> Int -> Int
sumThree x y z = x + y + z

-- Pure function: Applicative addition for Either
sumThreeApplicative :: Either String Int -> Either String Int -> Either String Int -> Either String Int
sumThreeApplicative e1 e2 e3 = pure sumThree <*> e1 <*> e2 <*> e3

-- Output logic
main :: IO ()
main = do
    let val1 = Right 10
    let val2 = Right 20
    let val3 = Right 30
    let err = Left "Error in calculation"
    
    putStrLn ("Success case: " ++ show (sumThreeApplicative val1 val2 val3))
    putStrLn ("Failure case: " ++ show (sumThreeApplicative val1 err val3))
