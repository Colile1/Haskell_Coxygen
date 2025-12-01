-- HC20T5.hs : Reader Monad Greeting
-- This file uses the Reader monad to create a configuration-based greeting system.

import Control.Monad.Reader

-- Pure function: Generates a greeting based on environment (Config)
greetUser :: String -> Reader String String
greetUser name = do
    greeting <- ask
    return (greeting ++ ", " ++ name ++ "!")

-- Output logic: 
main :: IO ()
main = do
    let config1 = "Sawubona"
    let config2 = "Hello"
    let user = "Colile"
    
    let msg1 = runReader (greetUser user) config1
    let msg2 = runReader (greetUser user) config2
    
    putStrLn msg1
    putStrLn msg2
