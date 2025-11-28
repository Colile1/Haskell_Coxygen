-- HC18T9: compositionLawCheck Function
-- Implement the compositionLawCheck function to verify the Functor composition law.

compositionLawCheck :: (Eq (f c), Functor f) => (b -> c) -> (a -> b) -> f a -> Bool
compositionLawCheck f g x = fmap (f . g) x == (fmap f . fmap g) x

main :: IO ()
main = do
    let x = Just 5
    let f = (+1)
    let g = (*2)
    print (compositionLawCheck f g x)  -- Should be True

    let y = [1, 2, 3]
    print (compositionLawCheck f g y)  -- Should be True
