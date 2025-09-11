-- HC1T5
infiniteNumbers :: [Int]
infiniteNumbers = [1..]

main :: IO ()
main = print (take 10 infiniteNumbers)
