-- HC8T1.hs : Type Synonyms and Basic Function
-- This file creates type synonyms and a function to generate a transaction string.

type Address = String
type Value = Int

generateTx :: Address -> Address -> Value -> String
generateTx from to val = from ++ " -> " ++ to ++ " : " ++ show val

get_generateTx :: IO String
get_generateTx = do
    putStrLn "Enter from address:"
    from <- getLine
    putStrLn "Enter to address:"
    to <- getLine
    putStrLn "Enter value:"
    val <- readLn
    return (generateTx from to val)

main :: IO ()
main = do
    tx <- get_generateTx
    putStrLn "Transaction: "
    putStrLn tx
