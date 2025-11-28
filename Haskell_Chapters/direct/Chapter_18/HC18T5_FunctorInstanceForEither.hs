-- HC18T5: Functor Instance for Either
-- Define a Functor instance for the Either type, applying fmap only to the Right case.

instance Functor (Either a) where
    fmap _ (Left x) = Left x
    fmap f (Right y) = Right (f y)

main :: IO ()
main = do
    print (fmap (+1) (Right 5))
    print (fmap (+1) (Left "error"))
