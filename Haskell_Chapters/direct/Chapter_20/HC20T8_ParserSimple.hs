-- HC20T8.hs : Parser Monad Simple
-- This file implements a basic Parser monad from scratch to parse simple characters.

import Control.Applicative
import Control.Monad

-- Data definition: A Parser is a function from String to list of (result, remaining_string)
newtype Parser a = Parser { runParser :: String -> [(a, String)] }

-- Pure function: Functor Instance
instance Functor Parser where
    fmap f (Parser p) = Parser $ \s -> [(f x, rest) | (x, rest) <- p s]

-- Pure function: Applicative Instance
instance Applicative Parser where
    pure x = Parser $ \s -> [(x, s)]
    (Parser pf) <*> (Parser px) = Parser $ \s -> 
        [(f x, s2) | (f, s1) <- pf s, (x, s2) <- px s1]

-- Pure function: Monad Instance
instance Monad Parser where
    return = pure
    (Parser p) >>= f = Parser $ \s -> 
        concat [runParser (f x) rest | (x, rest) <- p s]

-- Pure function: Alternative (for choice)
instance Alternative Parser where
    empty = Parser $ \_ -> []
    (Parser p1) <|> (Parser p2) = Parser $ \s -> p1 s ++ p2 s

-- Pure function: Parses a single character
item :: Parser Char
item = Parser $ \s -> case s of
    []     -> []
    (c:cs) -> [(c, cs)]

-- Output logic: 
main :: IO ()
main = do
    let parser = do { a <- item; b <- item; return [a, b] }
    let input = "Jo"
    putStrLn ("Parse result: " ++ show (runParser parser input))
