--HC17T3: Monoid Instance for Severity
--Implement the Monoid instance for the Severity type, where the identity value is Low.

data Severity = Low | Medium | High | Critical
  deriving (Show, Eq, Ord)

instance Semigroup Severity where
  (<>) = max

instance Monoid Severity where
  mempty = Low

main :: IO ()
main = do
  putStrLn "Severity Monoid"
  print (mempty <> Medium)  
  print (mempty <> Low)     
  print (High <> mempty)
bye