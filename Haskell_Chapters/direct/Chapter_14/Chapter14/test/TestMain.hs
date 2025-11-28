import Test.HUnit
import Data.List (sort, group)

charCounts :: String -> [(Char, Int)]
charCounts str = map (\cs -> (head cs, length cs)) (group (sort str))

testCounts :: Test
testCounts = TestList [
    "empty string" ~: charCounts "" ~?= [],
    "single char" ~: charCounts "a" ~?= [('a', 1)],
    "repeated chars" ~: sort (charCounts "hello") ~?= [('e',1),('h',1),('l',2),('o',1)],
    "mixed chars" ~: sort (charCounts "abcabc") ~?= [('a',2),('b',2),('c',2)]
  ]

main :: IO ()
main = do
    runTestTT testCounts
    return ()
