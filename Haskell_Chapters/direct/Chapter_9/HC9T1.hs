-- HC9T1.hs : Parametric Type Synonym
-- This file defines a parametric type synonym for entities with addresses.

-- Pure function: Defines a type synonym for Entity a.
type Entity a = (String, a)

main :: IO ()
main = do
    let entity = ("Colile", "Johannesburg") :: Entity String
    putStrLn ("Entity: " ++ show entity)
