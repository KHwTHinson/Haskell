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
  in_range :: Integer -> Integer -> Integer -> Bool
  in_range min max x = x >= min && x <= max

-- Executing the function
  in_range 0.5 1.5 1 -- <- Type error
  in_range 0 5 3 -- <- Correct
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
  in_range min max x =
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


















