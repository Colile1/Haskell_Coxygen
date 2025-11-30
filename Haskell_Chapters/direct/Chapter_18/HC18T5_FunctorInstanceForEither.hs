-- HC18T5: Functor Instance for Either
-- The Functor instance for Either is already defined in Data.Either.
-- fmap applies the function only to the Right case, leaving Left unchanged.

main :: IO ()
main = do
    print (fmap (+1) (Right 5 :: Either String Int))
    print (fmap (+1) (Left "error" :: Either String Int))
