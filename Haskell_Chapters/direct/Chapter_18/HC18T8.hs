-- HC18T8: identityLawCheck Function
-- Implement the identityLawCheck function to verify the Functor identity law.

identityLawCheck :: (Functor f, Eq (f a)) => f a -> Bool
identityLawCheck fa = fmap id fa == fa

main :: IO ()
main = do
    print (identityLawCheck [1, 2, 3])
    print (identityLawCheck (Just 5))
    print (identityLawCheck Nothing)
