-- HC18T7: fmapTuple Function
-- Define a function fmapTuple that applies a function to the second element of a tuple (a, b) using the Functor instance of (,) a.

fmapTuple :: (b -> c) -> (a, b) -> (a, c)
fmapTuple f (x, y) = (x, f y)

main :: IO ()
main = do
    print (fmapTuple (+1) ("hello", 5))  -- ("hello", 6)
    print (fmapTuple show (42, True))    -- (42, "True")
