-- HC10T1 - Task 1: ShowSimple Type Class
-- This code defines a new type class ShowSimple for simple string conversion, with a function showSimple :: a -> String, and implements an instance for the PaymentMethod type.

data PaymentMethod = Cardano | Cash | Country  -- Defines PaymentMethod data type with three constructors; alternative: use newtype for single constructor

class ShowSimple a where  -- Defines type class ShowSimple with one method; alternative: use Show built-in class
    showSimple :: a -> String  -- Method to convert to simple string; alternative: use show from Show class

instance ShowSimple PaymentMethod where  -- Instance for PaymentMethod; alternative: derive Show automatically
    showSimple Cardano = "Cardano"  -- Converts Cardano to string; alternative: use pattern matching with show
    showSimple Cash = "Cash"  -- Converts Cash to string; alternative: use case expression
    showSimple Country = "Country"  -- Converts Country to string; alternative: use if-then-else for custom logic

main :: IO ()  -- Main for testing
main = print (showSimple Cardano)  -- Prints "Cardano"; alternative: test all constructors
