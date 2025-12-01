-- HC20T20.hs : Batch Processing Bind
-- This file chains multiple monadic actions together using >>= (bind).

-- Pure function: Step 1
step1 :: Int -> Maybe Int
step1 x = Just (x + 5)

-- Pure function: Step 2
step2 :: Int -> Maybe Int
step2 x = Just (x * 2)

-- Pure function: Step 3 (Validation)
step3 :: Int -> Maybe Int
step3 x = if x > 20 then Just x else Nothing

-- Pure function: Chain
batchProcessing :: Int -> Maybe Int
batchProcessing start = step1 start >>= step2 >>= step3

-- Output logic: 
main :: IO ()
main = do
    let startVal = 10 -- 10 + 5 = 15; 15 * 2 = 30; 30 > 20 -> Just 30
    let result = batchProcessing startVal
    putStrLn ("Batch Result: " ++ show result)
