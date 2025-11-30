-- HC19T18.hs : Combine Multiple Either
-- This file handles multiple Either computations with potential errors.

import Control.Applicative

-- Pure function: sequences a list of Eithers
combineEitherResults :: [Either String Int] -> Either String [Int]
combineEitherResults = sequenceA

-- Output logic
main :: IO ()
main = do
    let successList = [Right 1, Right 2, Right 3]
    let failList = [Right 1, Left "Data corruption in Cape Town server", Right 3]
    
    putStrLn ("Success: " ++ show (combineEitherResults successList))
    putStrLn ("Failure: " ++ show (combineEitherResults failList))
