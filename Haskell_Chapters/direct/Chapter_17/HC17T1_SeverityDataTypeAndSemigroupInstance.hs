-- HC17T1: Severity Data Type and Semigroup Instance
-- Create a Severity data type representing the severity of an emergency with four levels (Low, Medium, High, Critical).

data Severity = Low | Medium | High | Critical
  deriving (Show, Eq, Ord)

instance Semigroup Severity where
  (<>) a b = max a b

main :: IO ()
main = do
  putStrLn "Severity Semigroup"
  print (Low <> Medium)     
  print (Medium <> High)    
  print (High <> Critical)  
  print (Critical <> Low)