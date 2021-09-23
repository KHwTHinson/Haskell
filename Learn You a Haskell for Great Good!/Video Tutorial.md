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

enter ghci by typing ```ghci``` in terminal; quit ghci by typing ```:quit```

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

Haskell's type inference is embedded in calculator: when division ```/``` happens , it always return a float:
```
3 / 2 = 1.5
```

Haskell can perform and return a large number which some other imperative languages will overflow:
```
3 ^ (19 * 19) = 17408965065903192790718823807056436794660272495026354119482811870680105167618464984116279288988714938612096988816320780613754987181355093129514803369660572893075468180597603
```

Haskell's common ```Boolean``` operator (```&&``` = ```and```, ```||``` = ```or```, ```not``` = ```not```, ```==``` = ```equal```, ```/=``` = ```not equal```)
```
True && False => False
True || False => True
3 == 4 => False
3 /= 4 => True
"Hello world" == "Hello world" => True
```

Haskell use fewer parentheses than other languages, e.g. functions not taking in ```( )```
```
max 3 5 * 2 = 10
(max 3 5) * 2 = 10
3 `max` 5 = 5
```

# Haskell 2b: Functions, if, and let [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=3)

- Enter ```ghci``` in the directory where the file is located
- Load the files by using ```:load <FileName>``` inside ghci (e.g. type ```:load baby``` for baby.hs inside the directory)
- Functions can be executed after loading the file where functions located.

```haskell 
if x then y else z
``` 

for simple logical operation

```let``` can be used in the ghci to define variable

- type error could be catch for number when Haskell thought it was an integer but the function only works with float.


# Haskell 2c: Lists [(Video Link)](https://www.youtube.com/watch?v=hJGEuFjcvZ8&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=4)
