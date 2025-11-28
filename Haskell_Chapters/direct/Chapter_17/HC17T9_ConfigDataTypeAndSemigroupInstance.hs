-- HC17T9: Config Data Type and Semigroup Instance
-- This file demonstrates Config data type with Semigroup instance.

data Config = Config { loggingLevel :: Int, timeout :: Int, retries :: Int }
  deriving (Show, Eq)

instance Semigroup Config where
  (<>) (Config l1 t1 r1) (Config l2 t2 r2) = Config (max l1 l2) (min t1 t2) (max r1 r2)

-- Pure function: Combines two configs.
combineConfigs :: Config -> Config -> Config
combineConfigs = (<>)

-- Input wrapper: Gets two configs and combines.
get_combineConfigs :: IO Config
get_combineConfigs = do
  putStrLn "Enter first config (loggingLevel timeout retries):"
  c1 <- parseConfig <$> getLine
  putStrLn "Enter second config (loggingLevel timeout retries):"
  c2 <- parseConfig <$> getLine
  return (combineConfigs c1 c2)
  where
    parseConfig s = let [l,t,r] = map read (words s) in Config l t r

main :: IO ()
main = do
  result <- get_combineConfigs
  putStrLn ("Combined config: " ++ show result)
