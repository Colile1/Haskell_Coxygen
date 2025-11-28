-- HC16T7: Element Existence in List
-- Write a function that checks if an element exists in a list.

elementExists :: Eq a => a -> [a] -> Bool
elementExists element list = element `elem` list

main :: IO ()
main = do
    putStrLn "Enter a list of elements separated by spaces:"
    listInput <- getLine
    let list = words listInput
    putStrLn "Enter the element to check:"
    elemInput <- getLine
    if elementExists elemInput list
        then putStrLn "The element exists in the list."
        else putStrLn "The element does not exist in the list."
