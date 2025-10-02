-- HC1T8
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

main :: IO ()
main = print (applyTwice (+3) 10)
