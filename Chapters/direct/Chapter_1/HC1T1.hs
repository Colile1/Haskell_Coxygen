-- HC1T1 -- Task 1: Function Composition
-- functions
double :: Int -> Int
double n = 2*n

increment :: Int -> Int
increment n = n + 1

doubleThenIncrement :: Int -> Int
doubleThenIncrement = increment . double

-- testing 
main :: IO ()
main = print (doubleThenIncrement 7)
