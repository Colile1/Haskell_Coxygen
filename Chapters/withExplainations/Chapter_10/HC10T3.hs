-- HC10T3 - Task 3: Comparable Type Class
-- This code defines a type class Comparable with compareWith :: a -> a -> Ordering and implements it for Blockchain.

data Blockchain = Bitcoin | Ethereum | Cardano  -- Example Blockchain data type; alternative: use newtype for single constructor

class Comparable a where  -- Defines Comparable type class
    compareWith :: a -> a -> Ordering  -- Method to compare two values; alternative: use Ord class

instance Comparable Blockchain where  -- Instance for Blockchain
    compareWith Bitcoin Ethereum = LT
    compareWith Ethereum Bitcoin = GT
    compareWith Bitcoin Cardano = LT
    compareWith Cardano Bitcoin = GT
    compareWith Ethereum Cardano = GT
    compareWith Cardano Ethereum = LT
    compareWith _ _ = EQ  -- Equal if same

main :: IO ()  -- Main for testing
main = print (compareWith Bitcoin Ethereum)  -- Expected LT
