-- HC20T11.hs : Random Walk State
-- This file simulates a random walk on a 1D line using the State monad (simulating randomness).

import Control.Monad.State
type RandomState = [Int]

-- Pure function: Gets next "random" number from state
nextInt :: State RandomState Int
nextInt = do
    nums <- get
    case nums of
        [] -> return 0
        (x:xs) -> do
            put xs
            return x

-- Pure function: Performs a walk of n steps
randomWalk :: Int -> State RandomState Int
randomWalk 0 = return 0
randomWalk steps = do
    move <- nextInt
    -- If even move +1, odd move -1
    let step = if even move then 1 else -1
    pos <- randomWalk (steps - 1)
    return (pos + step)

-- Output logic: 
main :: IO ()
main = do
    let pseudoRandoms = [2, 5, 8, 11, 14] -- Pre-determined "random" sequence
    let (finalPos, _) = runState (randomWalk 5) pseudoRandoms
    putStrLn ("Final Position after walk: " ++ show finalPos)
