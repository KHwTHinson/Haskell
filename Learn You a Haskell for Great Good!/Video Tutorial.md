# Haskell 1: Introduction [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=1)

## Purely functional programming language
Never consult memories nor have side effect
- Given same input Haskell function always produce same output
- Debugging will be much easier
- Multicore-machine friendly

## Lazy Language
Evaluate function whenever it is necessary

## Type Inference

# Haskell 2a: Haskell as a Calculator [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=2)

enter ghci by typing `ghci` in terminal; quit ghci by typing `:quit`

## Haskell can perform common calculation
Examples of common calculation
```
2 + 2 = 4
2 + 3 * 5 =17
8 - 3 = 5
```

Errors occurs when multiple performing with negative number without parenthesis
```
2 * -4 = ERROR
2 * (-4) = -8
```

Haskell's type inference is embedded in calculator: when division `/` happens , it always return a float:
```
3 / 2 = 1.5
```

Haskell can perform and return a large number which some other imperative languages will overflow:
```
3 ^ (19 * 19) = 17408965065903192790718823807056436794660272495026354119482811870680105167618464984116279288988714938612096988816320780613754987181355093129514803369660572893075468180597603
```

Haskell's common `Boolean` operator (`&&` = `and`, `||` = `or`, `not` = `not`, `==` = `equal`, `/=` = `not equal`)
```
True && False => False
True || False => True
3 == 4 => False
3 /= 4 => True
"Hello world" == "Hello world" => True
```

Haskell use fewer parentheses than other languages, e.g. functions not taking in `( )`
```haskell
max 3 5 * 2 = 10
(max 3 5) * 2 = 10
3 `max` 5 = 5
```

# Haskell 2b: Functions, if, and let [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=3)

- Enter `ghci` in the directory where the file is located
- Load the files by using `:load <FileName>` inside ghci (e.g. type `:load baby` for baby.hs inside the directory)
- Functions can be executed after loading the file where functions located.

```haskell 
if x then y else z
``` 

for simple logical operation

`let` can be used in the ghci to define variable

- type error could be catch for number when Haskell thought it was an integer but the function only works with float.


# Haskell 2c: Lists [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=4)

- Introduction of `head`, `tail`, `n : []`, `n : tail list`, `length`, `reverse`, `init`, `null`, `elem`

## New Concepts
- Constant time (length of the list doesnt matter)
-- e.g. `head`, `tail`, `null`
- Linear time (process time depends on the length of the list)
-- e.g. `length`, `reverse`, `!!`, `last`, `init`, `elem`, `++`, `"adam" < "ant"`, `maximum`, `minimum`, `sum`, `product`
- Haskell's string comes with order, which 0 < 1 < 9 < A < Z < a < z.

## New Functions Covered
- `!!` returns the specific number in the list. e.g. for list `let list = [1,3,5,10,11,16]`, `list !! 4` returns `11`.
- `++` returns a combined list. e.g. for `[1,2,2] ++ [1,3,5,10,11,16]` returns `[1,2,2,1,3,5,10,11,16]`.
- **Haskell's strings = list of characters**, e.g. ['f','n','o','r','d'] = "fnord"
- `..` can be used to create list. e.g. `[1..10]` returns `[1,2,3,4,5,6,7,8,9,10]`; `['a'..'e']` returns `['a','b','c','d','e']`; `[2,4..10]` returns `[2,4,6,8,10]`; `[10,9..1]` returns `[10,9,8,7,6,5,4,3,2,1]`; `[1..]` returns an infinitely long list. 
- `take n [1..]` returns a list with nth first terms. e.g. `take 5 [1..]` returns `[1,2,3,4,5]`.


# Haskell 2d: List comprehensions [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=5)
`[ result | variable <- value-to-be-assigned-to-veriable, second set of assignments / constraints, ...]`
- e.g. `[2^n | n <- [1..10]]` => `[2,4,8,16,32,64,128,256,512,1024]`
- e.g. `[2^n | n <- [1..10], 2^n >= 10, 2^n < 100]` => `[16,32,64]`
- e.g. `[x | x <- "outrageous", not (elem x "aeiou")]` => `"trgs"`
- List comprehensions allow stacking, e.g. 
  ```[[ x | x <- word, not (x `elem` "aeiou")] | word <- ["bell", "book", "candle"]]``` => `["bll","bk","cndl"]`
- e.g. `[[x * y | y <- [1..5]] | x <- [1..5]]` => `[[1,2,3,4,5],[2,4,6,8,10],[3,6,9,12,15],[4,8,12,16,20],[5,10,15,20,25]]`
- When multiple arguments taken, Haskell prioritize the last one `[x * y | y <- [1..3] , x <- [10,9,8]]` => `[10,9,8,20,18,16,30,27,24]`


# Haskell 2e: Tuples [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=6)
- List is a big type, while different size of tuples are different type
```
[1,2] == [1,2,3] => True
(1,2) == (1,2,3) => ERROR
```

- A list must store same type, while a tuple can store different types of infomration
```
[1,"two"] => ERROR
(1,"two") => (1,"two")
```

- For tuples, `fst` and `snd` only works for pairs
- `zip` is a functions to combine lists into a list of tuples (only for pairs), e.g. `zip "ab" [1,2]` => `[("a",1),("b",2)]`


# Haskell 3: Types and typeclasses [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=7)

Types: Set of values (e.g. Type `Integer` includes: 1,2,3,-3,0 etc) 
Typeclasses: Set of types (e.g. Typeclasses `Num` includes `Integer`, `Double`, `Int`, `Float` etc)

Check the type in ghci: `:t / :type True => Bool`, `:t 'a' => Char`
It also works on functions & operators e.g. (+) (-) (/)

Useful for debugging.


# Haskell 4: Function syntax [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=8)

### If, then, else statement
```haskell
increasing :: (Ord a) => [a] -> Bool
increasing xs = if xs == []
  then True
  else if tail xs == []
    then True
    else if head xs <= head (tail xs)
      then increasing (tail xs)
      else False
```
```haskell
noVowels :: [Char] -> [Char]
noVowels word = if word == ""
  then ""
  else if head word `elem` "aeiouAEIOU"
    then noVowels (tail word)
    else head word : noVowels (tail word)
```

### Pattern matching
```haskell
increasing :: (Ord a) => [a] -> Bool
increasing [] = True
increasing [x] = True
increasing (x:y:ys) = x <= y && increasing (y:ys)
```
```haskell
noVowels :: [Char] -> [Char]
noVowels "" = ""
noVowels (x:xs)= if x`elem` "aeiouAEIOU"
    then noVowels xs
    else x : noVowels xs
```

### Guard
```haskell
noVowels :: [Char] -> [Char]
noVowels "" = ""
noVowels (x:xs)
  | x `elem` "aeiouAEIOU" = noVowels xs
  | otherwise = x: noVowels xs
```

### Where
```haskell
watch :: Int -> [Char]
watch n = show n ++ " o'clock and all's well." ++ message n
  where message 7 = "... SHARKNADO!"
        message _ = "all's well."
```
Note: `show` Converts Values to String / `_` match anything

### `case`
```haskell
watch :: Int -> [Char]
watch n = show n ++ " o'clock and " ++ case n of 7 -> "... SHARKNADO!"
                                                 _ -> "all's well."
```

### `let`
```haskell
gravity :: (Fractional a) => a -> a
gravity r = let g = 6.674e-11
                earthMass = 5.972e24
            in g * earthMass / (r ^ 2 )
```

### Note: Haskell does not take tab (only spaces) & it is intentation (same level) sensitivity.




