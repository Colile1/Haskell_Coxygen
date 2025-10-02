-- HC2T6: Understanding Int vs Integer

smallNumber :: Int
smallNumber = 2^62

bigNumber :: Integer
bigNumber = 2^127

main = do
  print smallNumber
  print bigNumber
