-- HC8T10.hs : Deriving Show for Book
-- This file defines Book type deriving Show and creates a book.

data Book = Book String String Int deriving Show

book :: Book
book = Book "Haskell Guide" "Colile" 2023

main :: IO ()
main = do
    putStrLn "Book: "
    putStrLn (show book)
