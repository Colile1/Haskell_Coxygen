-- HC7T8.hs : Parse Shape Function
-- This file writes a function to parse a Shape from a string using Read.

-- Pure function: Defines the Shape data type.
data Shape = Circle Double | Rectangle Double Double deriving (Show, Read)

-- Pure function: Parses a shape from string, returning Maybe.
parseShape :: String -> Maybe Shape
parseShape s = case reads s of
    [(shape, "")] -> Just shape
    _ -> Nothing

-- Input wrapper: Gets a string from input.
get_parseShape :: IO (Maybe Shape)
get_parseShape = do
    putStrLn "Enter shape string (e.g., Circle 5.0):"
    s <- getLine
    return (parseShape s)

-- Output logic: Prints the parsed shape or Nothing.
main :: IO ()
main = do
    shape <- get_parseShape
    putStrLn "Parsed shape: "
    putStrLn (show shape)
