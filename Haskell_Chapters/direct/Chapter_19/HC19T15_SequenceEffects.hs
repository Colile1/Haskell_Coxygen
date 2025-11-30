-- HC19T15.hs : Sequence Effects
-- This file combines a list of applicative effects into a single effect.

import Control.Applicative

-- Pure function: Sequences a list of applicatives
sequenceEffects :: Applicative f => [f a] -> f [a]
sequenceEffects = sequenceA

-- Output logic
main :: IO ()
main = do
    let list = [Just 1, Just 2, Just 3]
    let result = sequenceEffects list
    putStrLn ("Sequenced Result: " ++ show result)
