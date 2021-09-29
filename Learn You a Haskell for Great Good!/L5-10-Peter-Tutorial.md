# Haskell 5: Recursion [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=9)

Base Case
`length' [] = 0`

Recursive Case
`length' (_:xs) = 1 + length' xs`

# Haskell 6a: Higher order functions [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=10)

Accept and return other function
```haskell
add1 :: Int -> Int
add1 x = x + 1
```

Functional lanaguage can accept functions as arguments for a function / return a function (using `( )`)

Taking function as an argument:
```haskell
f :: (Int -> Int) -> Int
f x = 3
```

```haskell
map add1 [1,2,3,4]
``` 
returns `[2,3,4,5]`

Returning a function
```haskell
g :: Int -> (Int -> Int)
g x = add1
```

```haskell

```
