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
```haskell
