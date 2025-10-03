-- HC5T10.hs : Check big square
-- This file contains a function that checks if any squared value in a list is greater than 50.

-- Pure function: Checks if any squared value is greater than 50.
hasBigSquare :: [Int] -> Bool
hasBigSquare = any (>50) . map (^2)

main :: IO ()
main = do
    putStrLn ("hasBigSquare [1,2,3,4]: " ++ show (hasBigSquare [1,2,3,4]))
    putStrLn ("hasBigSquare [6,7,8]: " ++ show (hasBigSquare [6,7,8]))
