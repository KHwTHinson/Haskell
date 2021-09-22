Tutorial link:
https://www.youtube.com/channel/UC3xdLFFsqG701QAyGJIPT1g/videos

# Haskell for Imperative Programmers #1 - Basics
- Declarative language
- Lazy evalaution

# Haskell for Imperative Programmers #2 - Functions, Types, let & where

## Functions
### Functions (Definition)
```haskell
name arg1 arg2 ... argn = <expr>
```

### Functions (Application)
```haskell
name arg1 arg2 ... argn
```


### Functions (Examples)
```haskell
-- Defining a function
in_range min max x =
  x >= min && x <= max

-- Executing the function
in_range 0 5 3
  => True
  
in_range 4 5 3
  => False 
``` 

### Types (Basics)
```haskell
x :: Integer
x = 1

y :: Bool
y = True

z :: Float
z = 3.1415
```

### Types (Functions)
```haskell
-- Defining a function
in_range2 :: Integer -> Integer -> Integer -> Bool
in_range2 min max x = x >= min && x <= max

-- Executing the function
in_range2 0.5 1.5 1 -- <- Type error
in_range2 0 5 3 -- <- Correct
```

### Functions (let)
Saving result the variable and return end statements

Imperative style (incorrect one)
```haskell
in_range min max x =
  in_lower_bound = min <= x;
  in_upper_bound = max >= x;
  return (in_lower_bound && in_upper_bound);
```

Declarative style (correct one)
```haskell
in_range3 min max x =
  let in_lower_bound = min <= x
      in_upper_bound = max >= x
  in
    in_lower_bound && in_upper_bound
```

### Functions (where)
Same as above, saving output:
```haskell
in_range min max x = ilb && iub
  where
    ilb = min <= x
    iub = max >= x
```

### Functions (if)
```haskell
in_range min max x =
  if ilb then iub else False
  where
    ilb = min <= x
    iub = max >= x
``` 

### Functions (Infix)

```haskell
ghci> :t (+)
(+) :: Num a => a -> a -> a
```

By putting a quote around then to write inflx functions
```haskell
add a b = a+b
add 10 20
10 `add` 20
```

# Haskell for Imperative Programmers #3 - Recursion, Guards, Patterns

## Recursion
As while loops and for loops are not existing in haskell, recursion can do similar tasks
Recursion: a function calling itself with other arguments
```haskell
name <args> = ... name <args'> ...
```

Example: function setting
```haskell
fac n =
  if n <= 1 then
    1
  else
    n * fac (n-1)
```

Example output
```
fac 3
- 3 * fac 2
-- 3 * 2 * fac 1
--- 3 * 2 * 1
-- 6 * 1
- 6
=> 6
```

## Guards
The first guard (expression on the left hand side) evaluated to be true will be taken as the definition of the functions.
There can be multuple guards
Last guard, the otherwise guard, is always taken and evaluated to be true.
```haskell
fac2 n
  |  n <= 1 =1
  |  otherwise = n * fac (n-1)
```

## Pattern Matching
```haskell
is_zero 0 = True
is_zero _ = False
```
Note: _ is a wildcard matches any patterns.

## Accumulators

```haskell
fac n = aux n 1
  where
    aux n acc
      |  n <= 1 = acc
      |  otherwise = aux (n-1) (n*acc)
```

# Haskell for Imperative Programmers #4 - Lists and Tuples

## Lists
Only one data type
```
[1,2,3,4,5] :: [Integer]
```

Lists can be constructed through so-called constructor:
```haskell
[]
x:xs
```

Examples:
```haskell
-- To generate
[1,2,3,4,5]

-- User
1 : 2 : 3 : 4 : 5 : []
```

### Generating a List

```haskell
asc :: Int -> Int -> [Int]
asc n m
  |  m < n = []
  |  m == n = [m]
  |  m > n = n : asc (n+1) m
    
asc 1 3
  => [1,2,3]
```

### Functions on Lists
```haskell
import Data.List
```

Examples of functions reside inside the module:

```haskell
-- Head give you first element of the list.
head :: [a] -> a
head [1,2,3,4,5]
  => 1

-- Tail gives you the first element removed of the list (only without first element).
tail :: [a] -> [a]
tail [1,2,3,4,5]
  => [2,3,4,5]
    
-- Length returns the length of the list.
length :: [a] -> Int
length [1,2,3,4,5]
  => 5


-- Init gives you the first element removed of the list (only without first element).
init :: [a] -> [a]
init [1,2,3,4,5]
  => [1,2,3,4]
    
-- Null function determines if a list is empty or not.
null :: [a] -> Bool
null []
  => True
null [1,2,3,4,5]
  => False

-- and: test if all arguments are true.
and :: [Bool] -> Bool
and [True, False, True]
  => False
    
-- or: test if either one argument is true. 
or :: [Bool] -> Bool
or [True, False, True]
  => True

```

### List Comprehension
Take one list or multiple lists then build a new list.

```haskell
[ 2*x | x <- [1,2,3] ] => [2,4,6]
[ 2*x | x <- [1,2,3], x > 1 ] => [4,6]
  
-- Can use multiple lists with multiple guards
[ <gen> | <elem> <- <list>, ... , <guard>, ...]
[ (x,y) | x <- [1,2,3], y <- ['a','b'] ]
  => [(1,'a'),(1,'b'),(2,'a'),(2,'b'),(3,'a'),(3,'b')]
```

### List Patterns
Rest of the list 'xs'. It is standard to call the list 'x' and 'xs'.
```haskell
sum :: [Int] -> [Int]
sum [] = 0
sum (x:xs) = x + sum xs
  
evens :: [Int] -> [Int]
evens [] = []
evens (x:xs)
  mod x 2 == 0 = x : evens xs
  otherwise = evens xs
```

## Tuples
An array of having multiple elements in a pair.
```haskell
(1,2) :: (Int, Int)
```

It can be used in pattern matching
```haskell
-- To define a function:
fst :: (a,b) -> a
fst (x,_) = x
  
snd :: (a,b) -> b
snd (_,y) = y
  
-- To use let binding:
let (x,y) = (1,2) in x
  => 1
```

Complex example:
```haskell
addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [ x+y | (x,y) <- xs ]
  
addTuples [(1,2), (2,3), (100,100)]
  => [3,5,200]
```

# Haskell for Imperative Programmers #5 - List Exercises

## Exercise #1
Create a function elem that returns True if an element is in a given list and returns False otherwise

```
elem :: (Eq a) => a -> [a] -> Bool
```





