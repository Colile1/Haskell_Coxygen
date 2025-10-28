-- HC4T6.hs : What's inside this list
-- This file contains a function that returns a string based on the number of elements in a list.

-- Pure function: Describes the contents of a list based on its structure.
whatsInsideThisList :: [Int] -> String
whatsInsideThisList [] = "It's empty!"
whatsInsideThisList [x] = "A single element: " ++ show x
whatsInsideThisList [x, y] = "Two elements: " ++ show x ++ " and " ++ show y
whatsInsideThisList (x:y:z:[]) = "The list has three elements: " ++ show [x,y,z]
whatsInsideThisList (x:rest) = "The first element is: " ++ show x ++ ", and there are quite a few more!"

main :: IO ()
main = do
    putStrLn ("whatsInsideThisList []: " ++ whatsInsideThisList [])
    putStrLn ("whatsInsideThisList [5]: " ++ whatsInsideThisList [5])
    putStrLn ("whatsInsideThisList [1,2]: " ++ whatsInsideThisList [1,2])
    putStrLn ("whatsInsideThisList [1,2,3]: " ++ whatsInsideThisList [1,2,3])
    putStrLn ("whatsInsideThisList [1,2,3,4]: " ++ whatsInsideThisList [1,2,3,4])
