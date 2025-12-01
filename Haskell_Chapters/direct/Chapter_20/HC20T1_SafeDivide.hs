-- HC20T1.hs : Safe Divide Maybe
-- This file demonstrates safe division using the Maybe monad to handle division by zero.

-- Pure function: Performs safe division (Returns Nothing if the divisor is 0, otherwise Just the result.)
safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide x y = Just (x `div` y)

-- Input wrapper: gets hardcoded values
get_inputs :: IO (Int, Int)
get_inputs = return (100, 2)

-- Output logic: 
main :: IO ()
main = do
    (n1, n2) <- get_inputs
    let result = safeDivide n1 n2
    let failResult = safeDivide n1 0
    
    putStrLn ("Safe Result: " ++ show result)
    putStrLn ("Fail Result: " ++ show failResult)
