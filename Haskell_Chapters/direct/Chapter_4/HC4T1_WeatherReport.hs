-- HC4T1.hs : Weather report
-- This file contains a function to report weather based on condition.

-- Pure function: Reports weather message based on condition.
weatherReport :: String -> String
weatherReport "sunny" = "It's a bright and beautiful day!"
weatherReport "rainy" = "Don't forget your umbrella!"
weatherReport "cloudy" = "A bit gloomy, but no rain yet!"
weatherReport _ = "Weather unknown"

main :: IO ()
main = do
    putStrLn ("weatherReport \"sunny\": " ++ weatherReport "sunny")
    putStrLn ("weatherReport \"rainy\": " ++ weatherReport "rainy")
    putStrLn ("weatherReport \"cloudy\": " ++ weatherReport "cloudy")
    putStrLn ("weatherReport \"windy\": " ++ weatherReport "windy")
