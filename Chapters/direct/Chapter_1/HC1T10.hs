-- HC1T10: Double User Input

doubleUserInput :: IO Int
doubleUserInput = do
  input <- getLine
  let n = read input :: Int
  return (2 * n)

main :: IO ()
main = do
  doubled <- doubleUserInput
  putStrLn ("Doubled number: " ++ show doubled)
