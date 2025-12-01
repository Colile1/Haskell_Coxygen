-- HC20T13.hs : Fibonacci Memoization
-- This file uses the State monad to memoize Fibonacci calculations.

import Control.Monad.State
import qualified Data.Map as Map

-- Data: State is a Map from Int to Integer
type Memo = Map.Map Int Integer

-- Pure function: Memoized Fibonacci
fibonacciMemo :: Int -> State Memo Integer
fibonacciMemo 0 = return 0
fibonacciMemo 1 = return 1
fibonacciMemo n = do
    memo <- get
    case Map.lookup n memo of
        Just result -> return result
        Nothing -> do
            a <- fibonacciMemo (n - 1)
            b <- fibonacciMemo (n - 2)
            let res = a + b
            modify (Map.insert n res)
            return res

-- Output logic: 
main :: IO ()
main = do
    let n = 50
    let (result, _) = runState (fibonacciMemo n) Map.empty
    putStrLn ("Fibonacci(" ++ show n ++ "): " ++ show result ++ " ")
