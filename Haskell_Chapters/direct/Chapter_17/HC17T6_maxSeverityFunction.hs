-- HC17T6: maxSeverity Function
-- This file demonstrates maxSeverity function using mconcat.

data Severity = Low | Medium | High | Critical
  deriving (Show, Eq, Ord)

instance Semigroup Severity where
  (<>) a b = max a b

instance Monoid Severity where
  mempty = Low

-- Pure function: Finds max severity in list.
maxSeverity :: [Severity] -> Severity
maxSeverity = mconcat

-- Input wrapper: Gets list of severities and finds max.
get_maxSeverity :: IO Severity
get_maxSeverity = do
  putStrLn "Enter number of severities:"
  n <- readLn
  severities <- sequence (replicate n getSeverity)
  return (maxSeverity severities)
  where
    getSeverity = do
      putStrLn "Enter severity (Low, Medium, High, Critical):"
      s <- getLine
      case s of
        "Low" -> return Low
        "Medium" -> return Medium
        "High" -> return High
        "Critical" -> return Critical
        _ -> do putStrLn "Invalid, defaulting to Low"; return Low

main :: IO ()
main = do
  result <- get_maxSeverity
  putStrLn ("Max severity: " ++ show result)
