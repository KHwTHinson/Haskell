# Introducing the Dot Operator `.`in Haskell
* A `.` operator takes in 3 arguments, two function and a input to the second function:
> <img width="557" alt="image" src="https://user-images.githubusercontent.com/90688504/167184068-662fde43-03ea-4e19-a846-b15c2678c349.png">

* What it could do is to supply the input of type `a` into a function `(a -> b)`, then get the output `b` which immediately supplies to function `(b -> c)`.
* Eventually getting the output of type `c`.

## Example with CSS syntax
* With `.` operator, we could rewrite a simple CSS constructor function below
>```Haskell
>classCSS :: String -> String -> String
>classCSS iden attr = "." ++ iden ++ " {" ++ attr ++ "}"  
>```
* to become with partial application
>```Haskell
>classCSS2 :: String -> String -> String
>classCSS2 iden = (++) ("." ++ iden ++ " {") . (++ "}")
>```
* A way to interpret the above is that:
> `(++) ("." ++ iden ++ " {")` is the first function supplies to `.` operator with type `(b -> c)`:
<img width="420" alt="image" src="https://user-images.githubusercontent.com/90688504/167186149-73ae5967-a690-4b20-bdf3-b05acb116cdd.png">

> `(++ "}")` is the second function supplies to `.` operator with type `(a -> b)`:
<img width="243" alt="image" src="https://user-images.githubusercontent.com/90688504/167186379-441847d3-77bf-49c8-86cf-a48eda38c189.png">

> While the third input is not supplied in the function `classCSS2 iden`, calling this function is indeed partially applying `.` operator with an input type of `a` awaiting.

### Test it out with input
>* Pre-defined helper functions
>```haskell
>style :: String -> String -> String
>style k v = k ++ ": " ++ v ++ ";"
>height :: String -> String
>height = style "height"
>```

* We could call the function with `classCSS2 "div" (height "200px")` in ghci.

> 1. `(++) ("." ++ "div" ++ " {") . (++ "}") (height "200px")`
> 2. Call the `(++)` function, awaiting 2 more arguments for `(++)`
> 3. Catch the first argument for `(++)` , which is `("." ++ "div" ++ " {") . (++ "}")`
> 4. Calculate `("." ++ "div" ++ " {") . (++ "}")` -> `".div {"`
> 
 * Till this point, Haskell has `(++) ".div {" . (++ "}")`
> 
> 5. Haskell then catches `.`, where `(++) ".div {"` accepts as the first argument of `.`
> 6. Now Haskell is looking for the second argument of `.`, which then catches `(++ "}")` on the right hand side
> 7. Recall the type of `(++ "}")` is `[Char] -> [Char]`, which is a valid argument for `.`, then Haskell accepts it as second argument
> 8. Then Haskell is looking for the third argument of `.`, which then catches `(height "200px")`
> 9. Calculate `(height "200px")`, returning `"height: 200px;"` which is a string with type `[Char]` which is a valid argument for `.`, then Haskell accepts it as third argument
> 
 * Till this point, Haskell has something like `(.) ((++) (".div {")) (++ "}") "height: 200px;"`
> 10. Pass in `"height: 200px;"` to `(++ "}")`, Haskell get `"height: 200px;}"`
> 
 * Till this point, Haskell has `(.) ((++) ".div {") "height: 200px;}"`
> 11. Pass in `"height: 200px;}"` to `(++) (".div {")`, Haskell get `".div {height: 200px;}"`
 * That's the end of whole operations


