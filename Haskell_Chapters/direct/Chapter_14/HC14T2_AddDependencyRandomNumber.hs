-- HC14T2: Add Dependency and Print Random Number
-- Modify the .cabal file to include a dependency on the random package and print a random number between 1 and 100.

import System.Random (randomRIO)

main :: IO ()
main = do
    num <- randomRIO (1, 100) :: IO Int
    putStrLn $ "Random number: " ++ show num
