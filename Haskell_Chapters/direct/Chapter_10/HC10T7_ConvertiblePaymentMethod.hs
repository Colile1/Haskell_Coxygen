-- HC10T7.hs : Convertible Type Class
-- This file defines a Convertible type class and implements it for converting PaymentMethod to String.

-- Pure function: Defines the PaymentMethod data type.
data PaymentMethod = Cardano | Cash | Country deriving Show

-- Pure function: Defines the Convertible type class.
class Convertible a b where
    convert :: a -> b

-- Pure function: Implements Convertible for PaymentMethod to String.
instance Convertible PaymentMethod String where
    convert Cardano = "Cardano"
    convert Cash = "Cash"
    convert Country = "Country"

main :: IO ()
main = do
    putStrLn ("Converted: " ++ convert Cardano)
