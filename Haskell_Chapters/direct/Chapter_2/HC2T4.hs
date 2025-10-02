-- HC2T4: Converting Between Infix and Prefix Notations

prefixAdd = (+) 5 3
prefixMul = (*) 10 4
prefixAnd = (&&) True False

infixAdd = 7 + 2
infixMul = 6 * 5
infixAnd = True && False

main = do
  print prefixAdd
  print prefixMul
  print prefixAnd
  print infixAdd
  print infixMul
  print infixAnd
