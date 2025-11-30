# Functor

Hakell Practical Tasks
Write code to complete Practical Tasks below. Haskell editor for testing is also found below this page.

Haskell Chapter 18 Practical Tasks: Functors and fmap
HC18T1: mapToLower Function with fmap
Define a function mapToLower using fmap that converts all characters in a list to lowercase.
HC18T2: Functor Instance for Tree
Create a Functor instance for the binary tree type Tree.
HC18T3: incrementTreeValues Function
Define a function incrementTreeValues that adds one to every value in a tree using the Functor instance.
HC18T4: mapToBits Function
Implement a function mapToBits to convert a list of Booleans to characters '1' or '0' using fmap.
HC18T5: Functor Instance for Either
Define a Functor instance for the Either type, applying fmap only to the Right case.
HC18T6: applyToMaybe Function
Implement a function applyToMaybe that uses fmap to transform the value inside a Maybe.
HC18T7: fmapTuple Function
Define a function fmapTuple that applies a function to the second element of a tuple (a, b) using the Functor instance of (,) a.
HC18T8: identityLawCheck Function
Implement the identityLawCheck function to verify the Functor identity law.
HC18T9: compositionLawCheck Function
Implement the compositionLawCheck function to verify the Functor composition law.
HC18T10: nestedFmap Function
Create a function nestedFmap that applies a function to a nested structure using multiple fmap calls.
Welcome to a new lesson of the Haskell curse. This one is all about the Functor type class.

Functors are 🌏 EVERYWHERE!! 🌎
In this lesson:

You'll understand the concept of Functor
You'll learn everything you need to know to use them in practice.
We have Functors in mathematics, programming languages, linguistics, under your bed waiting for you to go to sleep... Functors are everywhere!! You might have worked with functors without even knowing.

After this lesson, you will not only understand the concept of Functor in Haskell, but we'll also go the extra mile so you can learn everything you need to know to actually use it in practice.

And how are we going to do that? This is how:

Outline
Abstracting the map function
The Functor type class
Defining Functor instances
Seemingly unintuitive Functor instances
The Either a functor 🤔
The (,) a functor 🤨
The (->) r functor 🤯
Defining <$> and Lifting 🏋️ a function
Functor nesting dolls 🪆
Extra functions and Functor as defined in base
Abstracting the map function
This chapter will be super easy since you already know about map. Let's implement a function that returns the lower-case version of a String:

import Data.Char (toLower)

lowerString :: [Char] -> [Char]
lowerString []     = []
lowerString (x:xs) = toLower x : lowerString xs

lowerString "Hi, How's it Going?"
"hi, how's it going?"
Now, let's implement a function that adds one to a list of numbers:

addOne :: Num a => [a] -> [a]
addOne []     = []
addOne (x:xs) = (x + 1) : addOne xs

addOne [1,1,2,3]
[2,2,3,4]
And now, let's implement a function that transforms a list of boolean values to a list of characters representing bits:

boolToBit :: [Bool] -> [Char]
boolToBit []     = []
boolToBit (x:xs) = (if x then '1' else '0') : boolToBit xs

boolToBit [True,False,True]
"101"
Ok. So, I'm sure you see where I'm going with this. There's a repeating pattern, so we'll extract it into its own function.

Let's start with the type. As input, we have a list of characters, a list of types that are instances of the Num type class, and a list of booleans. So, the most general type would be [a] (a list of a) for the input list.

As output type, at first glance, we could use the same [a], but as we see in the boolToBit function, there are cases when you return a list with values of different types. So, there's no need to add an extra restriction to have the same type for the list that goes in and the one that goes out. So, let's use a different variable, like [b]:

map :: [a] -> [b]
Now, let's extract the pattern:

map []     = []
map (x:xs) = f x : map xs
This looks mostly ok. But we have to get the function f from somewhere, so we add it as a parameter. And, because the function f takes a value of type a from the input list and generates a value of type b from the output list, it follows that the function's type is a -> b. So, the final expression of our abstraction looks like this:

map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs


map toLower "Hi, How's it Going?"

map (+1) [1,1,2,3]

map (\x -> if x then '1' else '0') [True,False,True]
"hi, how's it going?"
[2,2,3,4]
"101"
Awesome! We abstracted away the concept of applying an arbitrary function to every value of a list, and we called this abstraction a "map." Then, we used this function to avoid repeating ourselves and simplify our code. This is cool, but we can do better. Let's go one level higher with the Functor type class:

Abstracting the Functor Type Class
In Haskell, we have lots of types. So, let's say we're working with optional values using the Maybe type. Same as with lists, we also need a way to conveniently modify values inside Maybe types. No biggy, we know the drill. We can define the maybeMap function:

maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap _ Nothing  = Nothing
maybeMap f (Just x) = Just (f x)


maybeMap toLower (Just 'A')

maybeMap (+1) (Just 3)

maybeMap (\x -> if x then '1' else '0') (Just True)


maybeMap toLower Nothing

maybeMap (+1) Nothing

maybeMap (\x -> if x then '1' else '0') Nothing
Just 'a'
Just 4
Just '1'
Nothing
Nothing
Nothing
As you can see, the maybeMap function can't do anything when the Maybe value is Nothing. This makes sense: Something went wrong before the value arrived at this function, so we should propagate the error. But, when we have a value, we apply the function to the value and wrap it again in a Just constructor.

Notice how the function we apply as the first parameter in both map and maybeMap is oblivious to the structure that contains the value it modifies. This is important because it means we could use the same functions in both cases and let map and maybeMap handle the details.

OK. Let's do a harder one. Let's say we want to work with binary trees:
data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show, Eq)


exampleTree = Node (Leaf 2) 1 (Node (Leaf 4) 3 (Leaf 5))
exampleTree


--   1
--  / \
-- 2   3
--    / \
--   4   5
Node (Leaf 2) 1 (Node (Leaf 4) 3 (Leaf 5))
Now, I can think of many scenarios that involve modifying the values of each node and leaf without changing the structure of the tree. Maybe the tree represents a family tree, and each number is the age of a family member. After one year passes, we have to update the ages of everyone by one. Or maybe it represents the hierarchical structure of positions in a company, and we have to update the salaries by some percentage to account for inflation.

Either way, we need to apply a function to the values without losing the structure. Same as we did for lists and Maybe values. So, we create treeMap:

treeMap :: (a -> b) -> Tree a -> Tree b
treeMap f (Leaf x)       = Leaf (f x)
treeMap f (Node lt x rt) = Node (treeMap f lt) (f x) (treeMap f rt)


treeMap toLower (Node (Leaf 'B') 'A' (Node (Leaf 'D') 'C'(Leaf 'E')))

treeMap (+1) (Node (Leaf 2) 1 (Node (Leaf 4) 3 (Leaf 5)))

treeMap (\x -> if x then '1' else '0') (Node (Leaf False) True (Node (Leaf False) True (Leaf True)))
Node (Leaf 'b') 'a' (Node (Leaf 'd') 'c' (Leaf 'e'))
Node (Leaf 3) 2 (Node (Leaf 5) 4 (Leaf 6))
Node (Leaf '0') '1' (Node (Leaf '0') '1' (Leaf '1'))
If it's a Leaf, treeMap applies the function to the current value. And if it's a Node, treeMap also applies the function to the current value and recursively calls treeMap on both branches.

As you can see, a new pattern is emerging:

map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs



maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap _ Nothing  = Nothing
maybeMap f (Just x) = Just (f x)



treeMap :: (a -> b) -> Tree a -> Tree b
treeMap f (Leaf x)       = Leaf (f x)
treeMap f (Node lt x rt) = Node (treeMap f lt) (f x) (treeMap f rt)
The map function modifies the elements of a list without changing its length or order.
The maybeMap modifies the elements of an optional value without changing its nature. It returns Nothing if the original value is Nothing and Just if it's Just.
The treeMap function modifies the elements of a tree without changing the amount and arrangement of nodes and leaves.
In all cases we apply a function to a value or values inside a structure without modifying the structure itself.

This seems like an extremely valuable abstraction, so let's extract it.

To extract map, we had to generalize the types of values inside the lists and the function we applied. Because that was what changed between examples.

Now, the thing that changes is the structure that holds these values, which, here, is represented by the list, Maybe, and Tree types. So, we have to provide this abstraction as a type class that types could implement. We'll call this type class Functor because of math terminology, but that doesn't change what the abstraction means to us.

So, what is a Functor in Haskell?

A Functor is a type that can apply a function to the values of a structure without modifying the structure itself.

We need only one behavior, the function that does the mapping. If we look at the map, maybeMap, and treeMap functions, we see that the first parameter, the function, is always the same. This makes sense since we said before that we wanted the functions to be independent of the structure. Then, the second and third parameters are always structures of as that become structures of bs. So, the type is almost there, we just need to generalize the structure itself. And that's how we obtain the type class definition:

class Functor f where
  fmap :: (a -> b) -> f a -> f b
The fmap (or "functor map") function takes a function that goes from a to b and a structure f containing elements of type a, and applies the function to the elements to return the same structure f but with elements of type b.

If, for some reason, having polymorphic type constructors such as f doesn't feel intuitive, we'll talk more about it when creating instances. But I'd still recommend you revisit lesson 10 ("Creating Type Classes and Instances"), where we discuss this subject in depth and define several type classes with increasing levels of complexity.

Ok. So, we have our Functor type class. But this is not over. We also have the requirement to avoid fmap changing the structure. What would that look like, though? Well, let's implement fmap for lists the wrong way:

-- map :: (a -> b) -> [a] -> [b]
-- map _ []     = []
-- map f (x:xs) = f x : map f xs

wrongFmap :: (a -> b) -> [a] -> [b]
wrongFmap _ []     = []
wrongFmap f (x:xs) = f x : f x : wrongFmap f xs

map (+1) [1,2,3]
wrongFmap (+1) [1,2,3]

(map (\x -> x - 1)) . (map (+1)) $ [1,2,3]
(wrongFmap (\x -> x - 1)) . (wrongFmap (+1)) $ [1,2,3]
[2,3,4]
[2,2,3,3,4,4]
[1,2,3]
[1,1,1,1,2,2,2,2,3,3,3,3]
If the structure doesn't change, we should get the original value if we apply a function and then apply the inverse. In this example, we first add one and then subtract one. In both cases, the types are correct. And we do get the original list using map. But because the wrongMap implementation concatenates each value twice, we get a completely new list instead of the original one!

An easier way to test this, however, would be with a function that doesn't do anything. That way, if we apply fmap to that function, we know we should get the same result as if we didn't do anything. Haskell has that function, and it's called id for identity:

-- id x = x

id 3 == 3

id [1,2,3] == [1,2,3] -- Apply id to the whole list

map id "Hello!" == "Hello!" -- Apply id to every element of the list

wrongFmap id "Hello!" == "Hello!"

wrongFmap id "Hello!"
True
True
True
False
"HHeelllloo!!"
Same as with Semigroup and Monoid, since we can't enforce this property through the type system, we'll define a law using this id function and ask developers to pretty-please follow it:

Identity law

fmap id == id
This basically means: "If you apply the identity function to every element of a structure using fmap, it should be the same as applying the identity function to the whole structure."

Because you have to return the same value and the id function is only concerned about the values inside your structure, you're forced to implement fmap in a way that maintains the structure.

This is it for this law. One itsy bitsy thing I didn't tell you, though, is that we have a second law. But before you feel betrayed, let me say you don't need to worry about this law! And I'll tell you why. Here's the composition law:

Composition law

fmap (f . g) == fmap f . fmap g
This law states that if you apply the composition of two functions to the elements of a structure using fmap, you have to get the same result as if you fmap one function and then fmap the other.

This is obviously an important property since we use function composition everywhere. But the cool thing is that you don't have to check for this law when defining your instance! Thanks to Haskell's type system, if you follow the identity law, you also implicitly follow the composition law!! We could prove that using equational reasoning, but it falls out of the scope of the course, so I'll leave a link in the description for the curious ones.

Ok. So, our final type class looks like this:

class Functor f where
  fmap :: (a -> b) -> f a -> f b
Identity law

fmap id == id
Composition law

fmap (f . g) == fmap f . fmap g
And that's it! This is what Functor is about.

Some explanations present functors as containers of values. Others, as values that have context. You can think of it however you want. The bottom line is that any type that is an instance of the Functor type class and follows the Functor's laws is a Functor.

And since we already have our type class, let's define some instances!

Defining Functor instances
First, let's review the type class kind:

:k Eq
:k Ord
:k Functor
Eq :: * -> Constraint
Ord :: * -> Constraint
Functor :: (* -> *) -> Constraint
Unlike Eq, Ord, and most other type classes we worked with before, Functor takes a type constructor of a kind star to star instead of a concrete type.

This means that you can create instances of Functor only for type constructors that take one concrete type. Let's see how that looks in practice for the Maybe type:

Maybe     -- * -> *
Maybe a   -- * 

instance Eq a => Eq (Maybe a) where -- ✅

instance Ord a => Ord (Maybe a) where -- ✅

instance Functor a => Functor (Maybe a) where -- ❌

instance Functor Maybe where -- ✅
As you can see, for Eq and Ord, we need to apply Maybe to the type variable a to get the correct kind. But it is not necessary for Functor.

Same with lists:

[]     -- * -> *
[a]    -- * 

instance Eq a => Eq [a] where -- ✅
  ...

instance Ord a => Ord [a] where -- ✅
  ...

instance Functor a => Functor [a] where -- ❌
  ...
  
instance Functor [] where -- ✅
  ...
And, as we saw on lesson 10, if you have a constructor that requires more than one concrete type, you can partially apply it:

data Present t a = Empty t | PresentFor t a

Present     -- * -> * -> *
Present t   -- * -> *
Present t a -- *

-----------------------------------------------------------------------

instance (Eq t, Eq a) => Eq (Present t a) where -- ✅
  ...

instance (Ord t, Ord a) => Ord (Present t a) where -- ✅
  ...

instance (Functor t, Functor a) => Functor (Present t a) where -- ❌
  ...

instance Functor (Present t) where -- ✅
  ...
If you're not 100% clear on this, revisit lesson 10. If you are, let's define some instances!:

-- class Functor f where
--   fmap :: (a -> b) -> f a -> f b
  
  
instance Functor [] where
  -- fmap :: (a -> b) -> [a] -> [b]
  fmap _ []     = []
  fmap f (x:xs) = f x : fmap f xs


instance Functor Maybe where
  -- fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap _ Nothing  = Nothing
  fmap f (Just x) = Just (f x)
These are the Functor instances for lists and Maybe types. I added the specialized type as a comment to help you visualize what's going on.

We don't run this cell because these instances are already present in the Prelude. But we can create one that it isn't:

instance Functor Tree where
  -- fmap :: (a -> b) -> Tree a -> Tree b
  fmap f (Leaf x)       = Leaf (f x)
  fmap f (Node lt x rt) = Node (fmap f lt) (f x) (fmap f rt)
As you can see, the implementations are the same functions we previously had implemented as separate versions of map. So, no surprise there.

We, however, now want to check if they work as expected and follow the identity law, so let's do that:

boolToBit :: Bool -> Char
boolToBit x = if x then '1' else '0'

exampleTree = Node (Leaf False) True (Node (Leaf False) True (Leaf True))

fmap boolToBit [False,True,False]

fmap boolToBit (Just True)

fmap boolToBit exampleTree

fmap id [1,2,3] == id [1,2,3]

fmap id (Just 'c') == id (Just 'c')

fmap id exampleTree == id exampleTree
"010"
Just '1'
Node (Leaf '0') '1' (Node (Leaf '0') '1' (Leaf '1'))
True
True
True
And those were our first three Functors in action. If you made it up until here, you learned what Functors are. But stay with me because there are a few practical aspects that you should really know about.

Seemingly unintuitive Functor instances
A few Functor instances seem unintuitive at first, and many new Haskell developers struggle to make sense of them. As part of my effort to give you the whole picture, let's explore them.

The Either a functor 🤔
The Either type constructor that takes two concrete types:

:k Either
:k Either String
Either :: * -> * -> *
Either String :: * -> *
So, to create a Functor instance, we have to partially apply one type variable:

instance Functor (Either a) where
  ...
We could interpret this as the error value of type a being (quote and quote) "part of the structure" of the functor. This means that values of type a should be kept untouched since fmap has to preserve the structure.

So, the instance of Functor for Either a is:

instance Functor (Either a) where
    fmap _ (Left x) = Left x
    fmap f (Right y) = Right (f y)
Which is virtually the same instance as Maybe. We ignore the failure case and only apply the function in the success scenario.

Here are some examples:

fmap (+1) (Left 1)

fmap (+1) (Right 1)

fmap toLower (Left 'A')

fmap id (Left 'A') == id (Left 'A')

fmap id (Right 'A') == id (Right 'A')
Left 1
Right 2
Left 'A'
True
True
Wasn't that hard, right? Let's keep going.

The (,) a functor 🤨
These are tuples:

:t ('c', True)

:t (True, 'c')

:t ('c', True, 1 :: Int)
('c', True) :: (Char, Bool)
(True, 'c') :: (Bool, Char)
('c', True, 1 :: Int) :: (Char, Bool, Int)
We already discussed in a previous lesson that the type of the tuple, unlike lists, depends on the amount and order of its values. If we ask the kind of all those tuples, of course, we get concrete types:

:k (Char, Bool)
:k (Bool, Char)
:k (Char, Bool, Int)

:k [Int]
:k []
(Char, Bool) :: *
(Bool, Char) :: *
(Char, Bool, Int) :: *
[Int] :: *
[] :: * -> *
But these types are just parentheses with commas that surround other types. So, could we remove the types to get a type constructor like we do with lists? Yes, we can! Because parentheses with commas are value constructors at the value level and type constructors at the type level.

:k (,)
:k (,,)


:k (,) Int  -- :k (a,) doesn't work. No sugar for tuples.
:k (,,) String Bool 
(,) :: * -> * -> *
(,,) :: * -> * -> * -> *
(,) Int :: * -> *
(,,) String Bool :: * -> *
These are just type constructors that take other types to create a concrete type. Tuples don't have the nice syntactic sugar that lists have, so we have to write first the constructor and then the type variables instead of having the type variables inside.

Based on this, we can create Functor instances for tuples as long as we partially apply type variables to get a kind star to star:

instance Functor ((,) a) where
  ...

instance Functor ((,,) a b) where
  ...
So, we have our types. How should we implement these instances? Well, we don't have much of a choice. For the pair, the first value of type a is part of the structure we can't touch, and for the tuple of three values, the first two values of type a and b are part of the structure. So, we can't touch either of those.

At the end of the day, the most obvious and straightforward definitions would be these ones:

instance Functor ((,) a) where
  fmap f (x,y) = (x, f y)


instance Functor ((,,) a b) where
  fmap f (x,y,z) = (x, y, f z)
This is sometimes unintuitive because you would assume that we should apply the function to all values, the same as lists. But the key here is to think in terms of value and structure.

The values of the lists are all the elements it contains, and the structure is the order and number of elements.

The case of tuples is different. For tuples, all the values except for the last one are part of the structure, as evidenced by the type we create the instance for. So, the only thing we can modify is the one value we don't provide a type variable for.

Let's test our instances:

fmap (+1) (1,1)

fmap (+1) ('a',1)

fmap (*2) (True,'a',2)

fmap toLower ('A','B')

fmap toLower (1,'B')

fmap toLower (2, True, 'A')

fmap id ('a',1 ) == id ('a',1 )

fmap id (2, True, 'A') == id (2, True, 'A')
(1,2)
('a',2)
(True,'a',4)
('A','b')
(1,'b')
(2,True,'a')
True
True
The (->) r functor 🤯
This might blow your mind, but I have to say it... functions are functors! Hear me out.

:k (Char, Bool)
:k (,)

biggerThan3 :: Int -> Bool
biggerThan3 = (>3)

:t biggerThan3
:k (Int -> Bool)

:k (->)
(Char, Bool) :: *
(,) :: * -> * -> *
biggerThan3 :: Int -> Bool
(Int -> Bool) :: *
(->) :: * -> * -> *
The arrow we use to define the type signatures of functions is a type constructor. This type constructor takes two concrete types and returns a concrete type.

Same as when we give two types like Char and Bool to the pair type constructor to get the type of a pair containing a character and a boolean if we give two types like Int and Bool to the arrow type constructor, we get the type of a function that takes an Int and returns a Bool.

So, guess what. We can do with the arrow constructor the same we did for pairs to create the Functor instance. We'll partially apply a type variable:

:k (,)      -- ❌
:k (,) Int  -- Functastic! ✅

:k (->)     -- ❌
:k (->) Int -- Functastic! ✅
(,) :: * -> * -> *
(,) Int :: * -> *
(->) :: * -> * -> *
(->) Int :: * -> *
We also don't have syntactic sugar in this case. So, our Functor instance would start like this:

instance Functor ((->) r) where
  ...
Remember that the r is the first type we apply the constructor to. So, it's the input type of the function.

Now, I'm aware this type is a bit overwhelming the first time you encounter it, so let's work our way through it. This is the type of fmap:

fmap :: (a -> b) ->      f a  ->      f b
In this particular instance of fmap, the Functor f is the arrow applied to a type variable:

fmap :: (a -> b) -> (->) r a  -> (->) r b -- Specialize f to (->) r
Haskell has syntactic sugar to show the arrow type in between the types as an infix function. That's how we've always used it. So let's change that:

fmap :: (a -> b) -> (r -> a)  -> (r -> b) -- (->) r a = (r -> a) 
And that's the type of fmap for this particular instance.

Now, we have to figure out the actual implementation. Both arguments are functions, so let's name them f and g:

instance Functor ((->) r) where
  -- fmap :: (a -> b) -> (r -> a) -> (r -> b)
  fmap          f           g     =    ...
Ok. So, as always, we need to apply the function f to g without changing the functor's structure.

In this case, the structure is arrow r ((->) r), which means that before applying fmap, the function takes a value of type r, so, after fmap, the function has to still take a value of type r, as shown in the resulting value. So, the only thing that changes is the value returned by the function. Before fmap is a value of type a, and after is a value of type b.

I'm pretty sure you could guess only by looking at the types. We need a function that takes r and returns b. And we have to obtain it using a function that takes r and returns a and a function that takes an a and returns a b. So, we compose them:

instance Functor ((->) r) where
  -- fmap :: (a -> b) -> (r -> a) -> (r -> b)
  fmap          f           g     =    f . g
And that's it. That's the instance. We can write it more succinctly, though. If we follow this series of simple transformations:

fmap :: (a -> b) -> (r -> a) -> (r -> b)
fmap       f           g     =   f . g
fmap       f           g     = (.) f g   -- Move `.` as prefix
fmap       f                 = (.) f     -- Rmv `g` from both sides
fmap                         = (.)       -- Rmv `f` from both sides
We get that the Functor instance for functions is actually just function composition:

instance Functor ((->) r) where
  -- fmap :: (a -> b) -> (r -> a) -> (r -> b)
  fmap = (.)
And now, let's try it out and test for the laws. Take into account that because we can not print functions to the console, I'll have to apply the function to some random value:

value1 :: Int -> Int
value1 = (*2)

:t value1
value1 3

:t (fmap (>4) value1)
(fmap (>4) value1) 3
value1 :: Int -> Int
6
(fmap (>4) value1) :: Int -> Bool
True
value2 :: Bool -> Char -- boolToBit function
value2 x = if x then '1' else '0'

:t value2
value2 True

:t (fmap succ value2)
(fmap succ value2) True
value2 :: Bool -> Char
'1'
(fmap succ value2) :: Bool -> Char
'2'
(fmap id value1) 5 == (id value1) 5

(fmap id value2) False == (id value2) False
True
True
It works!!

It's ok if you don't fully understand. This is one of the more abstract Functor instances you'll encounter. And, at the end of the day, if you remember that fmap for functions is function composition, you'll be fine.

Ok! That was the last instance we'll create today. But there are still a few other things about using Functors that we have to take a look at.

Defining <$> and lifting 🏋️ a function
fmap takes only two arguments, so we can easily use it as an infix function:

fmap toLower (Node (Leaf 'B') 'A' (Node (Leaf 'D') 'C'(Leaf 'E')))
toLower `fmap` (Node (Leaf 'B') 'A' (Node (Leaf 'D') 'C'(Leaf 'E')))


fmap (+1) (Just 3)
(+1) `fmap` (Just 3)


fmap (\x -> if x then '1' else '0') [True,False,True,False]
(\x -> if x then '1' else '0') `fmap` [True,False,True,False]


fmap (*2) [1,2,3]
(*2) `fmap` [1,2,3]
Node (Leaf 'b') 'a' (Node (Leaf 'd') 'c' (Leaf 'e'))
Node (Leaf 'b') 'a' (Node (Leaf 'd') 'c' (Leaf 'e'))
Just 4
Just 4
"1010"
"1010"
[2,4,6]
[2,4,6]
And, it turns out, it's usually more convenient to apply fmap as an infix function. Luckily, the base library has us covered, and we have this beauty:

(<$>) :: Functor f => (a -> b) -> f a -> f b
(<$>) = fmap

infixl 1 <&>
Notice that we have to constrain the f type constructor as an instance of the Functor type class because we're using fmap in the definition.

Using this infix synonym for fmap, we can write the previous code like this:

toLower `fmap` (Node (Leaf 'B') 'A' (Node (Leaf 'D') 'C'(Leaf 'E')))
toLower <$> (Node (Leaf 'B') 'A' (Node (Leaf 'D') 'C'(Leaf 'E')))


(+1) `fmap` (Just 3)
(+1) <$> (Just 3)


(\x -> if x then '1' else '0') `fmap` [True,False,True,False]
(\x -> if x then '1' else '0') <$> [True,False,True,False]


(*2) `fmap` [1,2,3]
(*2) <$> [1,2,3]
Node (Leaf 'b') 'a' (Node (Leaf 'd') 'c' (Leaf 'e'))
Node (Leaf 'b') 'a' (Node (Leaf 'd') 'c' (Leaf 'e'))
Just 4
Just 4
"1010"
"1010"
[2,4,6]
[2,4,6]
And that's how you use it.

Now, there's a reason as to why this operator has a dollar sign in the middle. This is an allusion to function application. If we look at the types:

 ($)  ::              (a -> b) ->   a ->   b
(<$>) :: Functor f => (a -> b) -> f a -> f b
We see that it looks quite familiar. Not only type-wise but conceptually as well. We know from lesson 5 that functions are right-associative, so we can surround the two types to the right, and it would be the same as not having them:

 ($)  ::              (a -> b) -> (  a ->   b)
(<$>) :: Functor f => (a -> b) -> (f a -> f b)
Looking at this, we see that the function application operator takes a function (a -> b) and returns the same function (a -> b) with no change. Which we already knew. We use this operator only because it's right-associative. Allowing us to remove the parenthesis.

But, if we look at the fmap operator (<$>), we see that it takes a function (a -> b) and returns the same function, but that now works for the functor version of a and b. This is what we call "lifting" a function. We say that the fmap operator (<$>) lifts the function (a -> b) to be able to work at the f level.

Just in case it didn't click, let's see two examples:

:t toLower             -- Type of original function
toLower 'A'

:t (toLower <$>)       -- Type of lifted function
toLower <$> Just 'A'


boolToBit :: Bool -> Char
boolToBit x = if x then '1' else '0'

:t boolToBit            -- Type of original function
boolToBit False

:t (boolToBit <$>)      -- Type of lifted function
boolToBit <$>  [False]
toLower :: Char -> Char
'a'
(toLower <$>) :: forall (f :: * -> *). Functor f => f Char -> f Char
Just 'a'
boolToBit :: Bool -> Char
'0'
(boolToBit <$>) :: forall (f :: * -> *). Functor f => f Bool -> f Char
"0"
And now that we have this new frame of looking at fmap and its infix synonym, we can easily understand how to deal with nested functors.

Functor nesting dolls 🪆
Nested functors are pretty common in Haskell because we combine types a lot. For example:

value1 :: Either String Bool
value1 = Right False

value2 :: [Either String Bool]
value2 = [Left "error", Right True, Right False]

value3 :: Maybe [Either String Bool]
value3 = Just [Left "error", Right True, Right False]

value4 :: Tree (Maybe [Either String Bool])
value4 = Leaf $ Just [Left "error", Right True, Right False]
All these values are nested functors. The number at the end of the name indicates the levels of nesting. value4, for example, has 4 levels of nesting: The Either a functor is inside the list functor, which is inside the Mabye functor, which is inside the Tree functor.

If you notice, all values have booleans at their core. So, if we want to modify them, we need to map a function that takes booleans as inputs. We already have boolToBit, so let's use that one:

boolToBit :: Bool -> Char
boolToBit x = if x then '1' else '0'

fmap boolToBit value1 -- value1 :: Either String Bool
Right '0'
So far, so good. Now, if we try to do the same with value2:

fmap boolToBit value2  -- value2 :: [Either String Bool]
<interactive>:1:16: error:
    • Couldn't match type ‘Either String Bool’ with ‘Bool’
      Expected type: [Bool]
        Actual type: [Either String Bool]
    • In the second argument of ‘fmap’, namely ‘value2’
      In the expression: fmap boolToBit value2
      In an equation for ‘it’: it = fmap boolToBit value2
Of course, we'll get an error because we're trying to apply a function that takes a boolean to an Either String Bool. The solution is deceptively simple. If you have two functor levels, you have to lift your function twice. Once to reach the list level and another one to reach the Either level:

:t boolToBit
:t (fmap boolToBit)
:t ((fmap . fmap) boolToBit)

(fmap . fmap) boolToBit value2 -- value2 :: [Either String Bool]
boolToBit :: Bool -> Char
(fmap boolToBit) :: forall (f :: * -> *). Functor f => f Bool -> f Char
((fmap . fmap) boolToBit) :: forall (f1 :: * -> *) (f2 :: * -> *). (Functor f1, Functor f2) => f1 (f2 Bool) -> f1 (f2 Char)
[Left "error",Right '1',Right '0']
And you can do it as many times as needed:

(fmap . fmap . fmap) boolToBit value3 -- value3 :: Maybe [Either String Bool]

(fmap . fmap . fmap . fmap) boolToBit value4 -- value4 :: Tree (Maybe [Either String Bool])
Just [Left "error",Right '1',Right '0']
Leaf (Just [Left "error",Right '1',Right '0'])
I hope that makes it easier to understand the concept of lifting. If you're still fuzzy about it, work through the types, and it'll make sense.

Now, as a final chapter, we'll see what other functions we get for free when we create an instance of functor.

Extra functions and Functor as defined in base
Now that we have the Functor type class, if we create functions that depend solely on fmap, we'll get functions that work for every Functor. For example, take a look at this unzip function:

unzip' :: [(a, b)] -> ([a], [b])
unzip' l = (map fst l, map snd l)


unzip' [('a', 2), ('b', 4), ('c', 6), ('d', 8)]
("abcd",[2,4,6,8])
The unzip function takes a list of tuples and returns a tuple containing one list with all the first elements and another with all the second elements. This function can be used (for example) to separate keys and values from key-value pairs.

Now, if we look at the definition, we use three functions. The fst and snd functions work on pairs. And map also works only on lists. But we have fmap now, a more general version of map. So, we can change the type from lists to Functors and use fmap instead:

unzipf :: Functor f => f (a, b) -> (f a, f b)
unzipf xs = (fst <$> xs, snd <$> xs)


unzipf [('a', 2), ('b', 4), ('c', 6), ('d', 8)]

unzipf (Just ('a', 2))

unzipf $ Node (Leaf ('a', 2)) ('b', 4) (Leaf ('c', 6))
("abcd",[2,4,6,8])
(Just 'a',Just 2)
(Node (Leaf 'a') 'b' (Leaf 'c'),Node (Leaf 2) 4 (Leaf 6))
Now we have an unzip function that works for every Functor.

That was one example, but we have a few more. Here are all the functions that come for free in the base library after you create an instance of Functor. Starting with the flipped fmap operator:

(<&>) :: Functor f => f a -> (a -> b) -> f b 
as <&> f = f <$> as  -- Flipped version of '<$>'.


((+1) <$> (Just 2)) == (Just 2) <&> (+1)


[1,2,3] <&> (+1)


Right 3 <&> (+1)
True
[2,3,4]
Right 4
We have a version of the map infix operator that takes the arguments flipped. First, the functor, and second, the function. This could be useful (for example) when you define a long inline function. If your function is several lines long, having the functor at the end makes it more difficult to spot it. So you can use this instead and provide the functor first.

Another one that comes for free is the "const fmap" operator :

(<$) :: a -> f b -> f a
(<$) =  fmap . const -- Replace all locations with the same value
'a' <$ Just 2

'a' <$ Nothing

'a' <$ [1,2,3,4,5,6]

3 <$ (Node (Leaf 'B') 'A' (Node (Leaf 'D') 'C'(Leaf 'E')))
Just 'a'
Nothing
"aaaaaa"
Node (Leaf 3) 3 (Node (Leaf 3) 3 (Leaf 3))
As you can see, we completely ignore the value already present in the functor and replace it with the value we provide as the first argument.

We also have a flipped version of this one:

($>) :: Functor f => f a -> b -> f b
($>) = flip (<$)  -- Flipped version of '<$'.

'a' <$ Just 2

Just 2 $> 'a'


'a' <$ [1,2,3,4,5,6]

[1,2,3,4,5,6] $> 'a'
Just 'a'
Just 'a'
"aaaaaa"
"aaaaaa"
As you can see, they are like arrows pointing to the value you'll get. This makes it easy to know the direction of the operator.

And finally, we have the void function:

void :: Functor f => f a -> f ()
void x = () <$ x  -- Discard or ignore the result of evaluation


void (Just 2)

void [1,2,3,4,5,6]

void (Node (Leaf 'B') 'A' (Node (Leaf 'D') 'C'(Leaf 'E')))
Just ()
[(),(),(),(),(),()]
Node (Leaf ()) () (Node (Leaf ()) () (Leaf ()))
This one becomes handy when dealing with side effects. If the functor has side effects, you can map through it to trigger them. And if you only care about those side effects but not the result, you can use void to ignore them. We'll talk more about this in the future. Don't worry too much about it for now.

So, after all this work, these are all the behaviors we get when defining an instance of Functor:

class Functor f where
    fmap :: (a -> b) -> f a -> f b
    
    (<$) ::     a    -> f b -> f a
    (<$) =  fmap . const  --  Replace with constant value.
    {-# MINIMAL fmap #-}
    

(<$>) :: Functor f => (a -> b) -> f a -> f b
(<$>) = fmap         -- An infix synonym for 'fmap'.

(<&>) :: Functor f => f a -> (a -> b) -> f b 
as <&> f = f <$> as  -- Flipped version of '<$>'.

($>) :: Functor f => f a -> b -> f b
($>) = flip (<$)     -- Flipped version of '<$'.

unzip :: Functor f => f (a, b) -> (f a, f b)
unzip xs = (fst <$> xs, snd <$> xs) -- Generalization of List's unzip

void :: Functor f => f a -> f ()
void x = () <$ x     -- Discard or ignore the result of evaluation
If we look at how Functor is defined in the base library, we'll see that one of the functions we just talked about is part of the type class, and the rest is not. We don't really care about that. They are all derived from fmap, so we still get all of them for free when defining the instance. The only real difference in your day-to-day is that you'll have to import Data.Functor to get the ones that are not part of the type class.

That's it for today! 😃
And that's it for today! I know it's a lot to take in, so feel free to revisit the lesson as many times as needed. Crucially, to genuinely understand it, you'll have to code it yourself. So, make sure to do your homework, and I'll see you in the next one!!