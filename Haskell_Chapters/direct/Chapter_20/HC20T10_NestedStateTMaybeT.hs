-- HC20T10.hs : Nested Transformers
-- This file implements a nested monad transformer stack: StateT over Maybe.

import Control.Monad.State
import Control.Monad.Trans.Maybe

-- Type Alias: State holds an Int, underlying monad is Maybe
type Stack = StateT Int Maybe

-- Pure function: Increments state, fails if state > 10
tick :: Stack ()
tick = do
    n <- get
    if n > 10 
        then lift Nothing -- Fail inside the inner monad
        else put (n + 1)

-- Output logic: 
main :: IO ()
main = do
    let startState = 9
    let result = runStateT (tick >> tick >> tick) startState
    
    case result of
        Nothing -> putStrLn "Computation failed (State exceeded limit)"
        Just ((), s) -> putStrLn ("Final State: " ++ show s)
