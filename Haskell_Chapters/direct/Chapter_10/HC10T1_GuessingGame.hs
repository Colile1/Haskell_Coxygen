-- HC10T1.hs : ShowSimple Type Class
-- This file defines a ShowSimple type class and implements it for PaymentMethod.

-- Pure function: Defines the PaymentMethod data type.
data PaymentMethod = Cardano | Cash | Country deriving Show

-- Pure function: Defines the ShowSimple type class.
class ShowSimple a where
    showSimple :: a -> String

-- Pure function: Implements ShowSimple for PaymentMethod.
instance ShowSimple PaymentMethod where
    showSimple Cardano = "Cardano"
    showSimple Cash = "Cash"
    showSimple Country = "Country"

main :: IO ()
main = do
    putStrLn ("Simple show: " ++ showSimple Cardano)
