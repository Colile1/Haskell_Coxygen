-- HC18T6: applyToMaybe Function
-- Implement a function applyToMaybe that uses fmap to transform the value inside a Maybe.

applyToMaybe :: (a -> b) -> Maybe a -> Maybe b
applyToMaybe = fmap

main :: IO ()
main = do
    print (applyToMaybe (+1) (Just 5))  -- Just 6
    print (applyToMaybe (+1) Nothing)   -- Nothing
