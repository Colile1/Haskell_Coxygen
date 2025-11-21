-- HC11T8.hs : Deriving Eq and Ord for PaymentMethod
-- This file derives the Eq and Ord instances for the PaymentMethod and tests comparisons.

-- Pure function: Defines the PaymentMethod data type with derived Eq and Ord.
data PaymentMethod = Cardano | Cash | Country deriving (Show, Eq, Ord)

main :: IO ()
main = do
    putStrLn ("Cardano == Cardano: " ++ show (Cardano == Cardano))
    putStrLn ("Cardano < Cash: " ++ show (Cardano < Cash))
    putStrLn ("Cash > Country: " ++ show (Cash > Country))
