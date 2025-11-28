Outline
Why Applicative functors?
Our journey until now
The limits of Functor
Function application at the Functor level 🥇
Being pure 😇
The Applicative type class
The Applicative laws
🎆 Programming with effects 🎆
Extra functions and Applicative as defined in base
Why Applicative functors?
Our journey until now
We need Applicative Functors (or Applicatives for short) due to a limitation of regular Functors. To provide some context, let's recap our abstraction journey for map and Functor.

We started with a bunch of recursive functions:

lowerString :: [Char] -> [Char]
lowerString []     = []
lowerString (x:xs) = toLower x : lowerString xs

addOne :: Num a => [a] -> [a]
addOne []     = []
addOne (x:xs) = (x + 1) : addOne xs

boolToBit :: [Bool] -> [Char]
boolToBit []     = []
boolToBit (x:xs) = (if x then '1' else '0') : boolToBit xs
These functions were useful. However, they were limited to applying a specific function to a list of specific types. However, we noticed that they had common traits that we could extract, and we got the map function:

map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs


lowerString = map toLower

addOne = map (+1)

boolToBit = map (\x -> if x then '1' else '0')
The map function is a more powerful version of these functions because it's more general. Now, we can apply any function to a list of values. And because it's more general, we can recreate the original functions by passing the concrete function we want to apply to the values.

But then, we faced a problem. map only works for lists. But there are plenty of structures with values we want to manipulate. If we implement their own map-like functions:

map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs



maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap _ Nothing  = Nothing
maybeMap f (Just x) = Just (f x)



treeMap :: (a -> b) -> Tree a -> Tree b
treeMap f (Leaf x)       = Leaf (f x)
treeMap f (Node lt x rt) = Node (treeMap f lt) (f x) (treeMap f rt)
We realize that these functions were useful. However, they were limited to specific structures. However, they had common traits that we could extract. And that's how we got the Functor type class:

A Functor is a type that can apply a function to the values of its structure without modifying the structure itself.

class Functor f where
    fmap :: (a -> b) -> f a -> f b
    
    (<$) ::     a    -> f b -> f a
    (<$) =  fmap . const
    {-# MINIMAL fmap #-}
Identity law

fmap id == id
Composition law

fmap (f . g) == fmap f . fmap g
The Functor type class is a more powerful version of those functions because it's more general. Now, we can apply any function to any structure that is an instance of Functor. And, of course, we can obtain what we had before (and more) by creating the instances:

instance Functor [] where
  -- fmap :: (a -> b) -> [a] -> [b]
  fmap _ []     = []
  fmap f (x:xs) = f x : fmap f xs


instance Functor Maybe where
  -- fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap _ Nothing  = Nothing
  fmap f (Just x) = Just (f x)
  
  
instance Functor Tree where
  -- fmap :: (a -> b) -> Tree a -> Tree b
  fmap f (Leaf x)       = Leaf (f x)
  fmap f (Node lt x rt) = Node (fmap f lt) (f x) (fmap f rt)
As you can see, every time we extracted a more general expression, we got a more powerful abstraction. But there are cases when Functor is not enough.

The limits of Functor
Let's try applying a few functions to a Functor. Let's say the Maybe functor:

:t (+1)             -- Int -> Int
:t (+1) <$> Just 3  -- Maybe Int
(+1) <$> Just 3

-----------------------------------------------------------------

-- Add (Just 3) and (Just 2)?
:t (+)             -- Int -> Int -> Int
:t (+) <$> Just 3  -- Maybe (Int -> Int)

-----------------------------------------------------------------

almostThere = (<$> Just 3) <$> ((+) <$> Just 2) 

:t  almostThere -- Maybe (Maybe Int)
almostThere
As you can see with the first example, we have no issue "fmapping" the function +1 to Just 3. But what if we want to add two Functors? If we check the result of applying the plus operator to Just 3, we get a function at the Functor level. We are not prepared for this!

We can use fmap to take regular functions and apply them to Functors. But we don't have a way to apply functions that already are at the Functor level to other Functors. In the last example, we did some juggling to get almost what we needed. We managed to add the values, but we ended up with duplicated Functors.

The worst thing is that this is a common scenario. We may want to add two optional values that we retrieved from our database, or maybe we want to apply a function to combine 3 Functors into one. It's more common to work with multiple Functors than with a single one. So, we need to solve this.

One solution would be to create other versions of fmap that can handle a function of two arguments. For example, like this:

fmap2 :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
fmap2 f (Just a) (Just b) = Just (f a b)
fmap2 _ _ _               = Nothing



fmap2 (+) (Just 3) (Just 2)
We take a binary function and two Maybe Functors. If both values are Just, we apply the binary function to the values and wrap it again, else, we return nothing because, if we are missing one or both values, we have no way of returning a valid result.

That would solve the problem. So, in theory, we could create a type class called, for example:

class Functor2 where
    fmap2 :: (a -> b -> c) -> f a -> f b -> f c
But that only works for binary functions. If we need to use a function that takes three, four, or five arguments, we would need to create:

class Functor3 where
    fmap3 :: (a -> b -> c -> d) -> f a -> f b -> f c -> f d
    

class Functor4 where
    fmap4 :: (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e


class Functor5 where
    fmap5 :: ...
You know where we're going with this. This method is unsustainable. It doesn't matter how many type classes you create; there's always a use case that requires more parameters. And, on top of that, we would have maybe dozens of type classes representing the same concept.

But don't worry, thanks to currying, there's a better way!

Function application at the Functor level 🥇
This is the key idea of the lesson. If you understand this section, the rest of the lecture will flow naturally.

Ok. So, we know that writing a fmap for every possible number of arguments is not feasible. But we don't have to. If we take a look at Haskell's function application:

    :: (a -> b) -> a -> b
($) :: (a -> b) -> a -> b

result = (+1) 3   -- 4
--           ^
--           |
--    Function application
--            |
--            ⌄
result = (+1) $ 3 -- 4
It takes a function that goes from a to b and a value of type a and returns a value of type b. It seems as if we could only apply a function of one argument to a value, but we know that in practice, we can do this:

calculate :: Int -> Int -> Int -> Int
calculate a b c = a + b * c

calculate 3 6 4
--       ^ ^ ^
--       | | |
--    Function application
So, how does this work? It's quite simple. Let's see it step by step:

($) :: (a -> b) -> a -> b
calculate :: Int -> Int -> Int -> Int
------------------------------------------------------------------------------------------

--          (a -> b)                a             b
-- /--------------------------\   /---\   /----------------\
   (Int -> (Int -> Int -> Int)) -> Int -> (Int -> Int -> Int)  -- type of first $
-- \________________________________________________________/
--        |
calculate $ 3 :: Int -> Int -> Int

------------------------------------------------------------------------------------------

--       (a -> b)            a          b
-- /-------------------\   /---\   /----------\
   (Int -> (Int -> Int)) -> Int -> (Int -> Int)  -- type of second $
-- \__________________________________________/
--              |
(calculate $ 3) $ 6 :: Int -> Int

------------------------------------------------------------------------------------------

--   (a -> b)       a      b
-- /----------\   /---\  /---\
   (Int -> Int) -> Int -> Int  -- type of third $
-- \_________________________/
--                    |
((calculate $ 3) $ 6) $ 4 :: Int
I use the dollar sign operator to more explicitly signify the operator that does the function application. But this is the same if we apply functions with the space as we did before.

So, we have the calculate function and the function application operator ($). Let's see the first step.

Function application takes a function that goes from a to b as the first argument, a value of type a as the second argument, and applies the function to the value to get a value of type b. If we apply function application to calculate as the first argument and 3 as the second argument, then the operator will have the type shown here. The key detail to notice is that both a and b can be of any type, we have no constraints. In our case, b is a function. So, after applying calculate to 3, we get a function that goes Int -> Int -> Int.

And now, we are at the same point as before, but with a function that takes one less value of type Int. So we can repeat the process. As we see in the second step, we apply function application to calculate $ 3 as the first argument and 6 as the second argument to get yet again a function, but this time one of type Int -> Int.

And if we repeat the process one last time, we apply the function application to calculate $ 3 $ 6 as the first argument and 4 as the second argument to get our final value of type Int.

So, we know that function application can be used to apply functions that take any amount of arguments by just applying the operation again and again until the function is fully applied.

That's our solution. We want to create an operator that works like function application but for functors. That way, it will work for functions of any number of arguments.

And we can do it quite intuitively. If regular function application has this signature:

($) ::                  (a -> b) ->   a ->   b
How would the type signature of the same function look if everything was a Functor? Well, you guessed it, like this:

(<*>) :: Functor f => f (a -> b) -> f a -> f b
We call this the "ap" or "apply" operator. We use an operator because, of course, it will be used mostly as an infix function. The type reflects that the behavior is the same as regular function application but lifted to work at the functor level.

It's important not to confuse the signatures of this functor-level function application with fmap:

(<$>) :: Functor f =>   (a -> b) -> f a -> f b
fmap takes a function that is not at the functor level and applies it to a functor. Once you apply the function the first time, the end result, be it the final value or a partially applied function, is now at the functor level. So we can not use fmap anymore.

Ok. To make it more concrete, let's define it for the Maybe functor:

(<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
Just f  <*> Just x  = Just (f x) 
_       <*> _       = Nothing 
We have to pattern-match to make sure that we actually have both the function and the value, then apply the function to get a value of type b, and wrap it again with the Just constructor. If we don't have both, we can't return a valid result, so we return Nothing.

This is really similar to the fmap definition. With the caveat that now, not just the value is optional, but also the function.

Now that we have our definition, let's try it out!:

Just (+1) <*> (Just 3)

Just (+) <*> (Just 3) <*> (Just 2)

calculate :: Int -> Int -> Int -> Int
calculate a b c = a + b * c

Just calculate <*> (Just 3) <*> (Just 2) <*> (Just 4)
Awesome!! It seems that it works. But, I assured you that the <*> operator is function application at the functor level, and I compared its type with the function application type to build my case. But I know that's not enough to convince a scholar like you, so it's time I prove it to you.

To prove that the <*> operator is function application at the functor level, I'm going to create a functor that doesn't do anything. If the structure doesn't do anything, then the <*> operator should return the same result as regular function application, right? So let's do that.

How do you imagine a functor that doesn't do anything looks like? It's actually pretty straightforward. We need a type that wraps another type and doesn't provide any functionality. Like this:

newtype Identity a = Identity { getIdentity :: a } deriving (Show, Eq)
As you can see, if we have a type with only one constructor, the only thing it does is hold the value inside. It's virtually the same as the underlying type but with the extra annoyance of having to wrap and unwrap it.

We call this type the Identity type for the same reasons we call the identity values and the identity function like that. They preserve the identity of the values they interact with. They don't do anything, basically.

Remember the newtype wrappers of the Semigroup and Monoid lessons? Those weren't identities because the behavior we gave them when defining their Semigroup and Monoid instances did something. So now, we have to also implement the type class instances in a way that they have no effect.

Ok. So, let's implement the Functor instance for the Identity type:

instance Functor Identity where
  --fmap :: (a -> b) -> Identity a -> Identity b
  fmap f (Identity a) = Identity (f a)
To do that, we'll pattern match to extract the internal value, apply the function, and wrap it again. It's the same as the Just case of the Maybe type, with the difference that because we only have one constructor, there's no option to fail, so we'll always be able to apply the function to the underlying value.

Let's try it out:

fmap (+1) (Identity 3) -- Identity 4

(*2) <$> Identity 3    -- Identity 6

'A' <$ Identity 3      -- Identity 'A'

fmap id (Identity False) == Identity False -- True
And as you can see, it works as expected and respects the Functor laws.

Now, we can create the <*> operator.

The type was:

(<*>) :: Functor f => f (a -> b) -> f a -> f b
So, we had a function at the functor level applied to a functor with values of type a to get the functor with values of type b. Because the Identity functor is basically just an annoying wrapper, we know that we have to unwrap, then apply the function to the value of type a, and wrap again. So let's do that:

(<*>) :: Identity (a -> b) -> Identity a -> Identity b
(Identity f) <*> (Identity x) = Identity (f x)
Pretty straightforward, almost the same as fmap. Now comes the moment of truth. Let's see if the apply operator is actually function application at the functor level:

(+1) 1
getIdentity $ Identity (+1) <*> Identity 1

(+) 1 2
getIdentity $ Identity (+) <*> Identity 1 <*> Identity 2

(\a b c -> a + b * c) 1 2 3
getIdentity $ Identity (\a b c -> a + b * c) <*> Identity 1 <*> Identity 2 <*> Identity 3
As you can see, we have three examples of applying the same function to a value or multiple values. Once without a functor using the built-in function application, and once using the apply operator within a Functor that doesn't do anything. And we get the same result in both cases.

We just showed that the apply operator is a more generalized form of function application. It's more general because we get the same old and boring function application if we specialize our new operator to the Identity functor. But we can also apply it to other functors.

Is this enough, though? Let's talk about pure.

Being pure 😇
We've shown that the apply operator is a generalized form of function application. Does that mean that we could handle all possible cases when working with Functors? Let's see.

When working with Functors, there are three possible base cases that you could combine to get more. You can have everything at the functor level:

If you ran all cells until now, restart the Kernel before continuing. This is to prevent errors due to the class of multiple <*> definitions.

Just (\a b c -> a + b * c) <*> Just 1 <*> Just 2 <*> Just 3
No issue with that. It works using the apply operator we just defined.

Another case is to have the need to apply a function that is not a functor to a bunch of functors:

--  ❌ Not a Functor ❌
-- /-------------------\
-- (\a b c -> a + b * c) <*> Just 1 <*> Just 2 <*> Just 3 -- ❌ 
--                      __|
--                     |
(\a b c -> a + b * c) <$> Just 1 <*> Just 2 <*> Just 3 -- ✅
No issue either. That is what fmap is for. We use it to lift the function and keep going with apply operators.

But, we could also encounter a third scenario. One when one or more values aren't functors:

--                              DB      Local    DB
Just (\a b c -> a + b * c) <*> Just 1 <*> 2 <*> Just 3
--                                        ^
--                                        |
--                              ❌  Not a Functor! ❌
This happens in tons of scenarios. For example, if two of the three values come from the database and the other one is provided locally.

We currently have no way to solve this. fmap lifts functions, not constant values. So, we need a way to lift arbitrary values. This function should take any value and return it embedded in a Functor. We could call this function lift, but for reasons we'll explain in the second to last section of this lesson, we'll call it pure:

pure :: Functor f => a -> f a
Regardless of how it's called, what it does is to lift values to the functor level.

We can define it trivially for the Maybe type like this:

pureMaybe :: a -> Maybe a
pureMaybe = Just

pureMaybe 'a'
pureMaybe 4
And having this function, we can solve the missing case like this:

Just (\a b c -> a + b * c) <*> Just 1 <*> pureMaybe 2 <*> Just 3
Of course, pureMaybe is specialized to the Maybe functor. So, it's the same as wrapping the value in a Just constructor. We want a function that works for all Functors, so this will also be part of our new type class.

And with this second behavior, we can apply any function to any amount of values at the functor level. To prove it to you, let's define fmap for all the functions from zero to five arguments using these two new operators:

    fmap0 :: a -> f a
    fmap0 = pure
    
    
    fmap1 :: (a -> b) -> f a -> f b
    fmap1 g fa = pure g <*> fa -- same as: g <$> fa


    fmap2 :: (a -> b -> c) -> f a -> f b -> f c
    fmap2 g fa fb = pure g <*> fa <*> fb


    fmap3 :: (a -> b -> c -> d) -> f a -> f b -> f c -> f d
    fmap3 g fa fb fc = pure g <*> fa <*> fb <*> fc


    fmap4 :: (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e
    fmap4 g fa fb fc fd = pure g <*> fa <*> fb <*> fc <*> fd

    ...
I removed the Functor constraint to avoid cluttering the slide, but remember that all the type-level fs are functors.

For fmap0, we have a function that takes zero arguments. That's a constant value. So, we need to embed a constant value into a functor. Easy, we use pure.

For fmap1, we have a function that takes one argument. We lift the function to the Functor level and then use the apply operator to apply the function to the argument.

For fmap2, we have a function that takes two arguments. We lift the function to the Functor level and then use the apply operator to apply the function to both arguments.

And it's the same for fmap3, 4, and 5. Lift the function and use the apply operator as many times as needed until the function is fully applied.

And, as I'm sure you might notice, fmap1 is the same as our regular fmap. And fmap2, 3, 4, and 5 all start with the same pure g <*> fa pattern. So, we can simplify a bit by replacing the first application of the apply operator with the functor operator to avoid having to lift the initial function before applying it:

    fmap0 :: a -> f a
    fmap0 = pure
    
    
    fmap1 :: (a -> b) -> f a -> f b
    fmap1 g fa = g <$> fa -- same as: pure g <*> fa 


    fmap2 :: (a -> b -> c) -> f a -> f b -> f c
    fmap2 g fa fb = g <$> fa <*> fb


    fmap3 :: (a -> b -> c -> d) -> f a -> f b -> f c -> f d
    fmap3 g fa fb fc = g <$> fa <*> fb <*> fc


    fmap4 :: (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e
    fmap4 g fa fb fc fd = g <$> fa <*> fb <*> fc <*> fd

    ...
Awesome!! We have proven that we only need the apply operator and pure to handle all cases. Plus, we can use fmap to make it more concise by avoiding explicitly lifting the initial function. I guess it's time to formalize our findings!!

The Applicative type class
Let's define an initial approximation of the Applicative type class based on what we know now:

Initial approximation:

"An Applicative is a Functor with a function to lift expressions (pure) and an operator that works as function application at the functor level (<*>)"

class Functor f => Applicative f where
    pure  :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b
This is not the final type class. But it already encapsulates the concept of Applicative, and it's enough to define a couple of instances so we can have something to work with while we figure out the laws. Because, of course, it has laws.

Let's start by defining the instance for Identity:

newtype Identity a = Identity { getValue :: a } deriving (Show, Eq)

instance Functor Identity where
  --fmap :: (a -> b) -> Identity a -> Identity b
  fmap f (Identity a) = Identity (f a)
Of course, because Applicative is a subclass of Functor, we first define Functor. It's pretty straightforward. We pattern match to extract the value wrapped with the Identity constructor, apply the function to the underlying value, and wrap it again. Now to the new part:

instance Applicative Identity where
  -- pure :: a -> Identity a
  pure = Identity
  
  -- (<*>) :: Identity (a -> b) -> Identity a -> Identity b
  -- Identity f <*> Identity a = Identity (f a)
  Identity f <*> ia = fmap f ia -- same as definition above
To create an instance for the applicative type class, we need to define both pure and the apply operator. We don't have much choice for pure. We need to lift a value to the Identity level, and we have only one constructor with the same type as pure. So we use that.

For the apply operator, we have two choices. We can pattern-match to extract both the function and the value, apply the function to the value, and wrap it again, or because we have fmap at our disposal, we can pattern-match to extract only the function and fmappit to the value. If you look at the definition of the functor instance, it's the same, but we avoid repeating ourselves.

Now that the Identity type is an applicative functor, we can use the operators:

Identity (+1) <*> Identity 1

Identity (+) <*> Identity 1 <*> Identity 2

Identity (\a b c -> a + b * c) <*> Identity 1 <*> pure 2 <*> pure 3
That one was boring, so let's do a new one. Let's create an instance for the Maybe type. Same as before, we start with the functor instance:

data Maybe a = Nothing | Just a

-------------------------------------------------------------------------

instance Functor Maybe where
  -- fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap _ Nothing  = Nothing
  fmap f (Just x) = Just (f x)

-------------------------------------------------------------------------

instance Applicative Maybe where
  -- pure :: a -> Maybe a
  -- pure = \x -> Nothing ❌
  pure = Just
  
  -- (<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
  Just f <*> ma = fmap f ma
  _      <*> _  = Nothing
We don't run this cell because these instances are already provided by the prelude.

We already implemented the Functor instance in the previous lesson, so we won't go there.

For the Applicative instance, we have two options that satisfy the types for pure. We could create a function that ignores the input and returns Nothing, or we could use Just that fits perfectly fine by itself. Conceptually, it makes sense to use Just because if we use Nothing, we'll always get Nothing independent of the value we lift. But, if that doesn't convince you, Just is the only option if we want to respect the laws of the type class!

The Applicative laws
Remember that one of the characteristics of functors was that fmap didn't change the structure itself. Only the values. Here, the apply operator has the same restriction.

Sadly, same as with Semigroup, Monoid, and Functor, not everything is reflected in the type class definition. So, we have to complement it with a few laws. Here they are:

Identity:

pure id <*> v = v
Applying a lifted id function to an applicative should return the same applicative. This makes sense, right? Same as when we deal with fmap, the apply operator should respect the structure of the Functor that is now an Applicative functor. Let's see an example with the Maybe type:

(pure id <*> Just 3) == Just 3

--------------------------------------------

wrongPure = \x -> Nothing

(wrongPure id <*> Just 3) == Just 3
As you can see, the apply operator should also respect the structure of the functor and only modify the values. If we don't do anything to the values, we should get our original applicative functor. That's why we have to use Just as pure. If we use a function like wrongPure that ignores the input and always returns Nothing, we have the correct type, but we change the structure when applying a lifted id function.

Next, we have the Homomorphism law:

Homomorphism:

pure f <*> pure x = pure (f x)
Applying a lifted function to a lifted value should be the same as applying the function to the value and then lifting the result. This enforces that the apply operator has to behave as the regular function application.

Let's see an example:

leftSide :: Maybe String
leftSide = pure show <*> pure 3

rightSide :: Maybe String
rightSide = pure (show 3)

leftSide == rightSide
leftSide
Amazing! It works as expected!! We still have two more to go through, though. Next, we have the composition law:

Composition:

(pure (.) <*> u <*> v) <*> w = u <*> (v <*> w) 
This one shows that the operator is associative, although it might not be evident at a glance, so here's an example:

leftSide  = (pure (.) <*> Just show <*> Just (*2)) <*> Just 3
rightSide =               Just show <*> (Just (*2) <*> Just 3)


leftSide == rightSide
leftSide
On the left side, we want to combine the show function with the (*2) function first and then apply it to 3. And we know that the way of combining functions is by composition. So, we lift function composition to the functor level and apply it to Just show and Just (*2). Then, we apply the result of that composition to Just 3.

On the right side, we first want to combine the last two and then combine the result with the first. In this case, we don't need to lift function composition because we can apply Just (*2) to Just 3 directly. So we do that to get Just 6 and then apply Just show to get the string representation of the number six.

As you can see, we get the same result on both sides.

Finally, we have the interchange law:

Interchange:

f <*> pure x = pure (\f -> f x) <*> f
This one states that we should get the same result if we flip the arguments when applying a function. We know this is true for regular function applications. For example:

leftSide  = (+1) 3
rightSide = (\f -> f 3) (+1) 


leftSide == rightSide
leftSide
On the left side, we apply the function (+1) and to 3 to get 4.

On the right side, we apply a function that takes another function as a parameter and applies it to the number three to the (+1) function. This results in +1 being passed as a parameter and being applied to 3.

As you can see, we have to do the extra step of adding a lambda function, but if we flip the arguments of function application, we still get the same result. That property should also hold with our apply operator:

leftSide  = Just (+1) <*> pure 3
rightSide = pure (\f -> f 3) <*> Just (+1) 


leftSide == rightSide
leftSide
This is the same as we just saw but lifted at the applicative functor level.

Same as before, we have to do the extra step of adding a lambda function. But if we flip the arguments of the apply operator, we still get the same result. And that's it!

To hone in on the type class implementation, let's do one more before moving on. Let's create the Applicative instance for the Either type:

instance Functor (Either e) where
  fmap f (Left e) = Left e
  fmap f (Right a) = Right (f a)

-----------------------------------------------------------

instance Applicative (Either e) where
  -- pure :: a -> Either a a
  pure = Right
  -- (<*>) :: Either e (a -> b) -> Either e a -> Either e b
  Left e <*> _ = Left e
  Right f <*> r = fmap f r
We use Right to lift the value with pure. If we follow the types, Right is our only choice. Also, it makes sense. Lifting anything to the Left constructor would be useless because it would make any function that uses it return Left regardless of the other values it's applied to. On top of that, it also makes sense from the Functor perspective. Left e is part of the structure. We want to lift a value, so we have to use a constructor that can hold a value, and the only one available is the Right constructor that can hold values of type a.

And for the apply operator, we have to take into account the cases that the function is both a Left and Right. If the function is a Left, it means we don't have a function. We have an error. So, we have no other option than propagating the error.

If the constructor is a Right, we do have the function. And in this case, we could have both Left and Right as the second argument, but we don't have to deal with that because we already defined fmap that does it for us. So, we just fmap the funciton.

And that's it! If we try to use it, we see that the results are reasonable:

Right (+1) <*> pure 1

(+) <$> Right 1 <*> Right 2

(\a b c -> a + b * c) <$> pure 1 <*> Left 2 <*> pure 3

(\a b c -> a + b * c) <$> Right 1 <*> pure 2 <*> pure 3
But reasonable is not enough. We have to check if our instance follows the Applicative laws. So, let's do that. Starting with the identity law:

-- Identity: pure id <*> v = v


(pure id <*> Left 3) == Left 3

(pure id <*> Right 'a') == Right (id 'a')
Nice. Our implementation follows the identity law. Now let's check for the Homomorphism law:

-- Homomorphism: pure f <*> pure x = pure (f x)


leftSide :: Either e Int
leftSide = pure (+1) <*> pure 1

rightSide :: Either e Int
rightSide = pure ((+1) 1)


leftSide == rightSide
Awesome! 2/4 done. Let's do composition next:

-- Composition: pure (.) <*> u <*> v <*> w = u <*> (v <*> w)


leftSide :: Either String Int
leftSide = pure (.) <*> u <*> v <*> w
  where
    u = Right (+1)
    -- v = Right (*2)
    v = Left "some error"
    w = Right 3

rightSide :: Either String Int
rightSide = u <*> (v <*> w)
  where
    u = Right (+1)
    -- v = Right (*2)
    v = Left "some error"
    w = Right 3


leftSide == rightSide
As you can see, this law holds as well. And, of course, we can change any of these three values to different ones, for example, Left "some error", and it will still hold.

And finally, we check for the interchange law:

-- Interchange: u <*> pure y = pure ($ y) <*> u


leftSide :: Either String Int
leftSide = u <*> pure 5
    where
        u = Right (+1)
        -- u = Left "some error"

rightSide :: Either String Int
rightSide = pure ($ 5) <*> u
    where
        u = Right (+1)
        -- u = Left "some error"


leftSide == rightSide
Amazing! Our implementation seems to follow all the Applicative laws. We now have the Identity, Maybe, and Either Applicatives under our belt. So, I think it's time to move on to programming with effects.

🎆 Programming with effects 🎆
Congratulations! You now know how to program with effects!! Oh, you didn't realize that? Well, you do! Here's why.

When we talked about Maybe, we said it gave us a way to represent values that might fail. We wanted to return a value, but we weren't sure if we were going to be able to, so we used Mabye:

-- We used optional values to create safe versions of partial functions
safeDiv :: Int -> Int -> Maybe Int
safeDiv x 0 = Nothing
safeDiv x y = Just (x `div` y)

8 `safeDiv` 2
8 `safeDiv` 0

-------------------------------------------------------------------------------

-- We used optional values to handle possible failed results
:t lookup
valueFromDB = lookup "Eren" [("Eren", 10), ("Mikasa", 25), ("Armin", 7)] -- Fake Database call
valueFromDB
In the first example, we see how we use optional values to create a safe version of div that doesn't crash our program if we try to divide by zero.

In the second example, we represent a value we retrieve from a database. The value could have not been there, so the lookup function produces a value of type Maybe to be able to return Nothing if it can't find the value in the list.

Now, imagine we need to apply the calculate function to a bunch of Maybe values:

calculate :: Int -> Int -> Int -> Int
calculate a b c = a + b * c
Before learning about Functor and Applicative, we could have defined a function that takes three Maybe values and applies calculate to them like this:

calculateMaybe ma mb mc = case ma of
    Nothing -> Nothing
    Just a -> case mb of
        Nothing -> Nothing
        Just b -> case mc of
            Nothing -> Nothing
            Just c -> Just (calculate a b c)


calculateMaybe (8 `safeDiv` 2) (pure 2) valueFromDB
We create a new calculateMaybe function to manually handle all possible failure cases. If all three values return a Just, we know we have all three underlying numbers, and we can apply the original calculate function to them. And, of course, we wrap the result in a Just constructor to get the correct type.

This has several disadvantages. One is that we have to create the new calculateMaybe function. Another is that calculateMaybe only works for Maybe values. Finally, we have to write a massive block pattern matching with case expressions to handle the Maybe values three times. The same code is repeated thrice.

But now that we have Functor and Applicative, we can do the same in one line:

calculate <$> (8 `safeDiv` 2) <*> (pure 2) <*> valueFromDB
We don't have to create a new function, we can replace the values we apply calculate to with any type that is an instance of applicative, and we don't have to handle the failure cases by hand because that is handled by the operators under the hood. This is what we achieved code-wise. But there's a different way of looking at this.

We can also think of Maybe as a type that provides the simulated effect of exception handling. In that case, the apply operator is a way to sequence effects and combine their results. As you can see in calculateMaybe, we sequence the exception handling one after the other and then apply calculate at the end to combine their results.

When we apply functions using the applicative operators, also called "applicative style", we do the same as in calculateMaybe but in a hidden and more convenient way. That's why it's understandable to be confused when I tell you we can think of it as an effect when you can clearly see in the body of calculateMaybe that it's actually pure code.

In Haskell, we have a bit of a loose concept of effects. Sometimes, the same code can be thought of as having an effect or not, depending on how you interpret it. So, to make it as crystal clear as possible, here are a few key clarifications that will save you a lot of time and headaches:

Haskell has both real effects and simulated effects.

Real effects are impure and unpredictable (e.g., IO)
Simulated effects look impure when you use them, but are actually pure under the hood (e.g., Maybe)
Simulated effects look impure because the computations are hidden from us behind types and operators. So, from the point of view of the user of those types and operators, it looks like they are running side effects, but it's actually pure code that they can not see.

Another worthy clarification is that:

Independently of whether they are real or simulated, all effects have an associated type and at least an Applicative instance (usually a Monad instance as well).

So, Applicative and Monad are the interfaces for effects. You can think of these type classes as the boundary between what it is and is not usually considered an effect. As a side note, don't worry about Monad yet. We'll cover it in a future lesson. Just know that Monads have a close relationship with Applicative and the concept of effects.

Let's see a few examples:

Examples of effects in Haskell:

Identity provides no effect.

Maybe provides the simulated effect of a computation that might fail.

Either provides the simulated effect of a computation that might fail with an error message or some context as to why we had an error.

[] provides the simulated effect of a non-deterministic computation. A computation that can have zero, one, or multiple results (each element on the list is a result).

IO provides the real effect of interacting with the world (keyboard, screen, internet,...).

We'll discuss more effects in later lectures, but let's stick with these ones for now to avoid overwhelming ourselves.

And thinking on these terms, now it makes sense why we called pure the function we use to lift values to the applicative functor level.

It's because we're embedding a value without an effect, a pure value, into an effectful context.

Once again, all we do with pure is to wrap the value with the correct expression, the same as we have been doing during this lesson. That hasn't changed. It's the way we think about what we do that changed.

We'll talk more about effects when we cover Monads. For now, with this new point of view, let's finish this lesson the same way we did with the Functor one. By exploring the extra functions we get for free with Applicative and presenting the type class and how it's defined in the base library.

Extra functions and Applicative as defined in base
The first functions we'll take a look at are the lift functions:

liftA :: Applicative f => (a -> b) -> f a -> f b
liftA f x = pure f <*> x -- Lift a unary function to actions.

liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
liftA2 f x y = f <$> x <*> y -- Lift a binary function to actions.

liftA3 :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
liftA3 f x y z = liftA2 f x y <*> z -- Lift a ternary function to actions.

--------------------------------------------------------------------------------

liftA (+1) [1, 2]
liftA (+1) (Just 3)

liftA2 (+) [1, 2] [3, 4]
liftA2 (+) (Right 2) (Right 3)

liftA3 (\a b c -> a + b * c) (Right 2) (Left "some error") (Right 4)
liftA3 (\a b c -> a + b * c) (Just 2) (Just 3) (Just 4)
[2,3]
Just 4
[4,5,5,6]
Right 5
Left "some error"
Just 14
These three functions are the same as we defined earlier as fmap, fmap2, and fmap3. They take functions that take one, two, and three arguments and lift them to work at the applicative functor level. Their names start with lift because we're lifting functions. Then, they continue with a capital A because we're lifting them to the applicative level and end with the number of arguments the lifted function takes. You'll encounter functions with this naming convention regularly since it's used all over the base library. So it's good to get used to it.

It seems like a bad joke. I just told you we don't need to define functions like these ones. And we don't! As you can see in the definitions, we can write any of them using only applicative style.

But there are reasons as to why we have these ones. Well, there are historical reasons. So, maybe if we wanted to design Haskell from scratch with what we know right now, we wouldn't have these functions. But there are also subtle non-historical reasons as to why we have them.

On one hand, because liftA and fmap are the same function, you could implement first the Applicative instance of a type and then implement the Functor instance defining fmap as a synonym to liftA. It seems counterintuitive because Functor is a superclass of Applicative. But, the same as we have mutually recursive functions for the Eq type class, the compiler doesn't care as long as both instances are defined and we eventually reach a base case. So, if, for some reason, defining the pure and apply operators is easier than defining fmap, you have the option of doing this. That's also why we use pure and the apply operator instead of fmap to define liftA. If we did that, and then you define fmap using liftA, we'll get infinite recursion. If that didn't make sense, it's OK. It's an implementation detail, not crucial.

Moving on to liftA2, it turns out that some functors support an implementation of liftA2 that is more efficient than using fmap and the apply operator. In particular, if fmap is an expensive operation, you can redefine the standard definition of liftA2 shown here with a more optimized one. That way, it would be better to use the optimized liftA2 than to fmap over the structure and then use <*>. We don't care about optimizing our code for now, so, for us, it's just a shorter way of lifting a binary function.

And finally, liftA3 is there because counting to two feels incomplete.

Jokes aside, in most scenarios, you should use fmap instead of liftA. And, if you have to lift a binary or ternary function, feel free to use liftA2 and liftA3 or applicative style. Whatever you like the best.

Now, let's move to more interesting ones.

Analogous to the Functor case, we have these two operators:

-- Sequence actions, discarding the value of the first argument.
(*>) :: Applicative f => f a -> f b -> f b
a1 *> a2 = (id <$ a1) <*> a2 


Just 2  *> Just 3
Nothing *> Just 3
Just 3
Nothing
The one that discards the value of the first argument, and:

-- Sequence actions, discarding the value of the second argument.
(<*) :: Applicative f => f a -> f b -> f a
(<*) = liftA2 const 


Just 2  <* Just 3
Nothing <* Just 3
Just 2
Nothing
The one that discards the value of the second argument.

We said that the apply operator sequences effects/computations/actions and combines their result. Well, these ones do the same but discard the value produced by one of the inputs. Notice that, same as with their analogous of the Functor type class, the arrow points to the value you'll get.

If you want to perform the effect or computation but don't care about the result, like printing to the console, you can use one of these.

Then, we have the reversed application operator:

(<**>) :: Applicative f => f a -> f (a -> b) -> f b
(<**>) = liftA2 (\a f -> f a) --  A variant of '<*>' with the types of the arguments reversed.

-----------------------------------------------------------------------------------------------

-- Attempt 1: Correct values, wrong effect order
(<*>) (id <$ print "Retrieve value from DB") (print "Save value in DB") 

-- Attempt 2: Corect values, wrong effect order
(flip (<*>)) (print "Save value in DB") (id <$ print "Retrieve value from DB")

-- Attempt 3: Correct values, correct effect order
(<**>) (print "Save value in DB") (id <$ print "Retrieve value from DB")
"Retrieve value from DB"
"Save value in DB"
"Retrieve value from DB"
"Save value in DB"
"Save value in DB"
"Retrieve value from DB"
This operator does the same as the apply operator, but it first takes the applicative value and then the applicative function.

This operator is helpful in cases where the values you get are ok, but the effects are in the wrong order. In this example, we're using IO effects. The IO type is an instance of Applicative.

In the first attempt, we evaluate the first Applicative and retrieve the value from our database. Then, we evaluate the second Applicative and save the value to the database. After running both effects, we apply the id function to the result of print, which is a unit.

The problem is, the effects are in the wrong order! We first need to save the value so we can then retrieve it. But we can not just change the order of the arguments. The result of the first effect is a function (in this case, the id function), and the result of the second effect is the constant value unit. One is a function, and the other is a constant value. So, what do we do?

One solution you could think of is to use the flip function we learned many lessons ago. It's designed to specifically flip the arguments of the function. That's what we see in the second attempt. And the code looks fine. But, if we evaluate the expression, we reduce this expression, and we end up having the same final one. The flip function only changes how we provide values to the original function but not how the values are evaluated. So, even if we write the values in a different order, the effects run in the same order. This is the problem this new operator solves. It not only flips the arguments but also resolves the effects in the order they are presented. So, we can finally first save the value in the database and then retrieve it.

Another useful one is the forever function:

forever :: (Applicative f) => f a -> f b
forever a = a *> forever a -- Same as: a *> a *> a *> a... infinitely


forever getLine
firsr
second
third
fourth
...
As you can see by the definition, we get an applicative, perform its effect, ignore the result, and recursively run forever with the same Applicative. This function will never stop by itself.

It's the first time we have a forever looping function that is actually useful! Now that we have Applicatives, we can perform effects. So, now, infinite loops make sense because we're not interested in what the function returns but in what the effect does. A common use case, for example, is to have a server forever listening to client connections. As we saw before, the IO type is an instance of Applicative, so we can use the *> sequence operator. You want the server to keep listening as long as you have it running, so you use an infinite loop.

Another cool thing we can do with Applicative is to have conditional execution of expressions:

-- Execute Applicative if Bool is True:
when :: (Applicative f) => Bool -> f () -> f ()
when = 😳

-- Execute Applicative if Bool is False:
unless :: (Applicative f) => Bool -> f () -> f ()
unless = 🫣
Here, we have the when and unless functions. when executes the applicative expression only when Bool is true. And unless executes it unless it's true. I'm not showing you the implementation because you'll have to implement them yourself on the homework. But an example will do fine:

import Control.Monad (when, unless)


when   True  (putStrLn "when is True")
when   False (putStrLn "when is False")
-----------------------------------------
unless True  (putStrLn "unless is True")
unless False (putStrLn "unless is False")
when is True
unless is False
You might have noticed that I'm importing the functions from Control.Monad instead of Control.Applicative. That's because these functions (and others we'll discuss later) were constrained by the Monad type class before the Applicative type class was fully integrated into the base library. Because maintainers wanted to minimize breaking changes, these (and other) functions were left in the Monad module but with the Applicative constraint instead of the Monad constraint. So, for all intents and purposes, these are Applicative functions that happen to be in a different module because of historical reasons.

If you think we're talking a lot about Monads for a lesson about Applicatives, it's because before, this behavior of sequencing effects was found in the Monad type class. So, the Applicative type class stole a lot of the work that used to be done by the Monad type class, and there are still a few loose ends sprinkled around the base library.

Coming back to the when and unless functions, to give you some extra help, take a look at this example:

printEvenNumbersUntilZero :: Int -> IO ()
printEvenNumbersUntilZero n = when   (even n) (print n) *> 
                              unless (n <= 0) (printEvenNumbersUntilZero (n-1))

printEvenNumbersUntilZero 15
14
12
10
8
6
4
2
0
You can almost read the expression as if it were plain English. The printEvenNumbersUntilZero function takes a number, and when it's even, it prints it. Then, unless it's less or equal to zero, it recursively calls printEvenNumbersUntilZero with the number reduced by one.

This is just one example of things you could do with these functions.

I think those were enough clues for you. Let's keep going, two functions to go:

replicateM :: (Applicative m) => Int -> m a -> m [a]
replicateM n action | n <= 0    = pure []
                    | otherwise = (:) <$> action <*> replicateM (n-1) action
The replicateM function takes an Int that we named n and an applicative that we named action. Then, it executes the action n times and returns an Applicative with a list containing all the results.

Same as with the when and unless functions, replicateM suffers from historical baggage. It has an upper-case M at the end, signaling that it works with Moads, and the type variable constrained by Applicative is a lower-case m, signaling that it used to be a type variable constrained by Monads. If we would write the base library from scratch today, we would likely call this function replicateA and use f for the type variable. But do not let that distract you. For you, this is an Applicative function, the same as the others.

In the definition, we have two cases. If the number is zero or negative, we shouldn't do anything, so we return an empty list lifted to the Applicative level. Or, in other words, we embed a pure empty list in the effect of the Applicative. Whichever might be.

Otherwise, we have a number larger than zero, so we run the action and add the result to a list. We can do that easily thanks to the fmap and apply operators. And since we have to accumulate the results in a list, we concatenate them. So, we use fmap to apply the pure cons operator to our applicative, and then we apply the partially applied cons operator at the applicative level to a recursive call of replicateM with a reduced n. So, we will keep lifting cons operators and applying them to the result of evaluating the applicative until we reach zero and return the empty list. At that point, we have a list of all the results concatenated in a list, which is what we needed.

Let's see an example:

import Control.Monad (replicateM)

get3Answers :: String -> IO [String]
get3Answers q = putStrLn q *> replicateM 3 getLine

get3Answers "What are your 3 favorite Pokemon?"
What are your 3 favorite Pokemon?
["Pikachu","Mimikyu","Scizor"]
We create the get3Answers function that takes a String, which is the question we want to ask, and returns a list of Strings containing the answers. We can use the *> sequence operator to first print the question, ignore the result, and then use replicateM to run getLine three times and get the result as a list of strings.

We also have a variation of replicateM called repliacteM_:

replicateM_ :: (Applicative m) => Int -> m a -> m ()
replicateM_ = 🤷
The underscore at the end is another naming convention followed by many functions that deal with effects. If a function ends with an underscore, it means that it ignores the result and returns the (). So, if you only care about the effect and not the value, use a function that ends with an underscore.

It's usual to have the same function with and without the underscore. Both do the same, but one returns a value, and the other returns a useless ().

So, now that you know this, you know what replicateM_ does. It does the same as replicateM but returns () instead of the list of resulting values. I'm not going to show the implementation because you have to do it in the homework, but here is an example of why would you want to use it:

import Control.Monad (replicateM_)

saveToDB = id -- use your imagination

getAndSave3Answers :: String -> IO ()
getAndSave3Answers q = putStrLn q *> replicateM_ 3 (saveToDB getLine)

getAndSave3Answers "What are your 3 favourite pokemon?"
What are your 3 favourite pokemon?
Here, we create the getAndSave3Answers function that does the same as the get3Answers function, but now it saves the answers in a database.

In this case, we print the question, ignore the result and then use replicateM_ to execute the saveToDB getLine applicative three times. Because the applicative's effect already saves the values to the database, I have no reason to return them, so I use the underscore version of replicateM.

And there are many more functions like these ones that we could talk about. But we're going to leave it here for the sake of time, and because after all we discussed so far, you can search for them in the documentation by yourself and quickly understand what they do.

So, after all this work, this is what we've got. It's a lot, so I had to split it into 3 different slides:

An Applicative is a Functor with operations to embed pure expressions (pure) and sequence computations/effects combining their results (<*>).

class Functor f => Applicative f where
    pure :: a -> f a -- Lift a value.

    (<*>) :: f (a -> b) -> f a -> f b
    (<*>) = liftA2 id -- Sequential application.

    liftA2 :: (a -> b -> c) -> f a -> f b -> f c
    liftA2 f x = (<*>) (fmap f x) -- Lift a binary function to actions.

    (*>) :: f a -> f b -> f b
    a1 *> a2 = (id <$ a1) <*> a2 -- <*> discarding the val of the 1st arg.
    
    (<*) :: f a -> f b -> f a
    (<*) = liftA2 const -- <*> discarding the val of the 2nd arg.
    {-# MINIMAL pure, ((<*>) | liftA2) #-}
If we look at how Applicative is defined in the base library, we'll see that several of the functions we just talked about are part of the type class, and three that we don't see here are not. As with Functors, we don't care about that distinction since they all come for free when you define the Applicative instance.

As you can see, we have mutual recursion between the apply operator and liftA2. The rest of the functions (except for pure) are defined using one of those. So, at the end of the day, we have to provide pure with either the apply operator or liftA2, whichever you prefer to implement.

On top of that, every type that has an instance of this Applicative type class has to respect these laws:

Applicative laws

Identity:

pure id <*> v = v
Homomorphism:

pure f <*> pure x = pure (f x)
Composition:

(pure (.) <*> u <*> v) <*> w = u <*> (v <*> w) 
Interchange:

f <*> pure x = pure (\f -> f x) <*> f
Finally, we also gain a ton of utility functions that are not part of the type class but are available in the base library:

(<**>) :: Applicative f => f a -> f (a -> b) -> f b

liftA  :: Applicative f => (a -> b) -> f a -> f b

liftA3 :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d

forever :: Applicative f => f a -> f b

when    :: Applicative f => Bool -> f () -> f ()

unless  :: Applicative f => Bool -> f () -> f ()

replicateM  :: Applicative m => Int -> m a -> m [a]
                    
replicateM_ :: Applicative m => Int -> m a -> m ()

filterM     :: Applicative m => (a -> m Bool) -> [a] -> m [a]

-- 🔥 AND MORE!!!!! 🤯
It's dramatic the number of functions we unlock by creating an instance of Applicative. So many that we couldn't cover all of them. The power that this abstraction provides is huge! Use it responsibly.

And that's it for today! 😃
We introduced only one more abstraction today, but we also talked about how we can interpret types that are instances of Applicative as effects. If that didn't quite click, it's OK. We'll talk more about effects in the monad lesson. For now, the best would be to get comfortable both defining and using the operators independently of how you think about it. And for that, make sure to do your homework, and I'll see you in the next one!!