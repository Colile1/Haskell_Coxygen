-- HC17T7: multiplyProducts Function
-- This file demonstrates multiplyProducts function using mconcat.

newtype Product a = Product a deriving (Show, Eq)

instance Num a => Semigroup (Product a) where
  (<>) (Product a) (Product b) = Product (a * b)

instance Num a => Monoid (Product a) where
  mempty = Product 1

-- Pure function: Multiplies list of products.
multiplyProducts :: Num a => [Product a] -> Product a
multiplyProducts = mconcat

-- Input wrapper: Gets list of numbers and multiplies them.
get_multiplyProducts :: IO (Product Int)
get_multiplyProducts = do
  putStrLn "Enter number of values to multiply:"
  n <- readLn
  values <- sequence (replicate n (putStrLn "Enter a number:" >> readLn))
  return (multiplyProducts (map Product values))

main :: IO ()
main = do
  result <- get_multiplyProducts
  putStrLn ("Product: " ++ show result)
