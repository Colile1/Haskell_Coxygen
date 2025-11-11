-- HC17T10: Monoid Instance for Config
-- This file demonstrates Monoid instance for Config.

data Config = Config { loggingLevel :: Int, timeout :: Int, retries :: Int }
  deriving (Show, Eq)

instance Semigroup Config where
  (<>) (Config l1 t1 r1) (Config l2 t2 r2) = Config (max l1 l2) (min t1 t2) (max r1 r2)

instance Monoid Config where
  mempty = Config 0 maxBound 0  -- lowest loggingLevel, highest timeout, lowest retries

-- Pure function: Combines list of configs.
combineConfigList :: [Config] -> Config
combineConfigList = mconcat

-- Input wrapper: Gets list of configs and combines.
get_combineConfigList :: IO Config
get_combineConfigList = do
  putStrLn "Enter number of configs:"
  n <- readLn
  configs <- sequence (replicate n getConfig)
  return (combineConfigList configs)
  where
    getConfig = do
      putStrLn "Enter config (loggingLevel timeout retries):"
      s <- getLine
      let [l,t,r] = map read (words s)
      return (Config l t r)

main :: IO ()
main = do
  result <- get_combineConfigList
  putStrLn ("Combined config: " ++ show result)
