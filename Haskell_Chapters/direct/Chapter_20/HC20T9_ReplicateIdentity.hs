-- HC20T9.hs : Replicate Identity
-- This file uses the Identity monad to replicate a value.

import Control.Monad.Identity

-- Pure function: Replicates a value inside the Identity context
replicateMonad :: Int -> a -> Identity [a]
replicateMonad n x = return (replicate n x)

-- Output logic: 
main :: IO ()
main = do
    let result = runIdentity (replicateMonad 3 "Colile")
    putStrLn ("Replicated Identity: " ++ show result)
