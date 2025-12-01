-- HC20T6.hs : Double Monad MaybeT
-- This file demonstrates the MaybeT transformer to combine List and Maybe effects.

import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Class (lift)
import Control.Monad (guard)

-- Pure function: Finds even numbers using MaybeT over List
-- If the number is odd, it returns Nothing (filtered out).
-- The List monad handles the non-determinism (multiple results).
processNumbers :: [Int] -> MaybeT [] Int
processNumbers nums = do
    n <- lift nums    -- Lift the list into MaybeT
    guard (even n)    -- Using guard from MonadPlus logic
    return n

-- Output logic: 
main :: IO ()
main = do
    let inputs = [1, 2, 3, 4, 5, 6]
    -- runMaybeT unwraps the transformer returning m (Maybe a), here [Maybe Int]
    let result = runMaybeT (processNumbers inputs)
    putStrLn ("Filtered Evens (List of Maybes): " ++ show result)
