-- HC8T4.hs : Record Syntax for Employee
-- This file defines Employee type using record syntax and creates an employee.

data Employee = Employee { name :: String, experienceInYears :: Float }

richard :: Employee
richard = Employee { name = "Richard", experienceInYears = 7.5 }

main :: IO ()
main = do
    putStrLn "Employee name: "
    putStrLn (name richard)
    putStrLn "Experience: "
    putStrLn (show (experienceInYears richard))
