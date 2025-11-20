-- create a data type called light_state and this data type consists orf three constructors and these constructors are on, off, and dimmed. 
-- create a function called toggle, that toogles the light state, i.e if the light state is on, it will turn it off, 

-- light_state data type
data LightState = On|Off|Dimmed deriving (Show, Eq)

-- Pure functiion
toggle :: LightState -> LightState
toggle On = Off
toggle Off = Dimmed 
toggle Dimmed = On

-- main functiom
main :: IO ()
main = do
    let state1 = toggle Off
    print (state1)
    let state2 = toggle state1
    print (state2)
    let state3 = toggle state2
    print (state3)
