# Haskell Chapter 15: Semigroups

## What is a Semigroup?

A semigroup is a mathematical structure consisting of a set together with an associative binary operation. In Haskell, the `Semigroup` type class represents this concept. It provides a way to combine two values of the same type into a single value, with the property that the operation is associative.

The `Semigroup` type class is defined as:

```haskell
class Semigroup a where
    (<>) :: a -> a -> a
```

The key property is associativity: for all `a`, `b`, and `c` of type `a`, `(a <> b) <> c == a <> (b <> c)`.

## Examples of Semigroups in Haskell

### Lists

Lists form a semigroup under concatenation. The `<>` operator concatenates two lists:

```haskell
[1,2,3] <> [4,5,6]  -- Results in [1,2,3,4,5,6]
```

### Strings

Strings (which are lists of characters) also form a semigroup:

```haskell
"Hello" <> " " <> "World"  -- Results in "Hello World"
```

### Sum and Product

The `Sum` and `Product` newtypes from `Data.Monoid` form semigroups:

```haskell
Sum 3 <> Sum 4  -- Results in Sum 7
Product 3 <> Product 4  -- Results in Product 12
```

### Unit Type

The unit type `()` forms a semigroup where `<>` always returns `()`:

```haskell
() <> ()  -- Results in ()
```

## Relation to Monoids

Every monoid is a semigroup, but not every semigroup is a monoid. A monoid additionally requires an identity element. In Haskell, the `Monoid` type class extends `Semigroup`:

```haskell
class Semigroup a => Monoid a where
    mempty :: a
    mappend :: a -> a -> a
    mappend = (<>)
```

For example, lists form a monoid with `[]` as the identity, while natural numbers under addition form a semigroup but not a monoid (no identity element).

## Using Semigroups

To use semigroups in your code, import the `Semigroup` type class:

```haskell
import Data.Semigroup
```

Then you can use the `<>` operator to combine values of semigroup types.
