data Log = Log [String] deriving Show 

instance Semigroup Log where 
    (Log a) <> (Log b) = Log (a <> b)

main :: IO()
main = do
    let log1 = Log ["words 1 "]
    let log2 = Log ["more words 2 "] 
    let logs = log1 <> log2
    print (logs)
