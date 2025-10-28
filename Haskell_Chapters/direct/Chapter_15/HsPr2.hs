-- data called log that takes a list of strings, 
-- make log an instance of a semigroup
-- concatinate the strings

log = Log ["word1"]
log2 = Log ["word2"]

logs = log <> log2

main :: IO()
main = do 
    print (logs)