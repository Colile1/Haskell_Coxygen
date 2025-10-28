import Data.Monoid (Sum(Sum), Product(Product), (<>))

main :: IO()
main = do
    print ([1,2,3] <> [3,4,5])
    print ("Hello"<> " " <>"me"<>" " <>"myself"<> "and" <>"I")
    print (Sum 3 <> Sum 4)
    print ()

    print (Product 3    4)

    let a = 3
    let b = 4 
    print (a <> b)