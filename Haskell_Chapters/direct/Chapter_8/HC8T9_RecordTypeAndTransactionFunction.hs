-- HC8T9.hs : Record Type and Transaction Function
-- This file defines Transaction type using record syntax and a function to process it.

data Transaction = Transaction { from :: String, to :: String, amount :: Float }

processTransaction :: Transaction -> String
processTransaction tx = "Transfer " ++ show (amount tx) ++ " from " ++ from tx ++ " to " ++ to tx

tx :: Transaction
tx = Transaction { from = "Alice", to = "Bob", amount = 100.0 }

main :: IO ()
main = do
    putStrLn "Transaction: "
    putStrLn (processTransaction tx)
y