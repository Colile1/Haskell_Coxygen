-- HC11T2.hs : Fancy Function for WeAccept
-- This file implements the fancyFunction for the WeAccept type class and tests it with various types like Cardano, Cash, and Country.

-- Pure function: Defines the WeAccept type class.
class WeAccept a where
    fancyFunction :: a -> String

-- Pure function: Defines the PaymentMethod data type.
data PaymentMethod = Cardano | Cash | Country deriving Show

-- Pure function: Implements WeAccept for PaymentMethod.
instance WeAccept PaymentMethod where
    fancyFunction Cardano = "Accepted Cardano"
    fancyFunction Cash = "Accepted Cash"
    fancyFunction Country = "Accepted Country"

main :: IO ()
main = do
    putStrLn ("Cardano: " ++ fancyFunction Cardano)
    putStrLn ("Cash: " ++ fancyFunction Cash)
    putStrLn ("Country: " ++ fancyFunction Country)
