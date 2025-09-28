main :: IO ()
main = do
    putStrIn " Enter a Number "
    input <- getline
    let number = read input :: int
    putStrIn ( "the result is : " ++ show (number * 2))

