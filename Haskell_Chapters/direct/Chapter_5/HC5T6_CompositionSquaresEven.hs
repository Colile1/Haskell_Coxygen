-- HC5T6.hs : Squares even
-- This file contains a function that squares numbers and filters even ones using composition.

-- Pure function: Squares numbers and filters even ones.
squaresEven :: [Int] -> [Int]
squaresEven = filter even . map (^2)

main :: IO ()
main = do
    putStrLn ("squaresEven [1,2,3,4]: " ++ show (squaresEven [1,2,3,4]))
    putStrLn ("squaresEven [5,6,7]: " ++ show (squaresEven [5,6,7]))
