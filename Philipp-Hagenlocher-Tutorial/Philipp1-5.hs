import Debug.Trace

-- Defining a function
in_range min max x =
  x >= min && x <= max

-- Executing the function
-- in_range 0 5 3
--   => True
  
-- in_range 4 5 3
--   => False 

-- Defining a function (with type defined)
in_range2 :: Integer -> Integer -> Integer -> Bool
in_range2 min max x = x >= min && x <= max

-- Executing the function
-- in_range2 0.5 1.5 1 -- <- Type error
-- in_range2 0 5 3 -- <- Correct

-- Function (let) with saving variable to be used inside the function
in_range3 min max x =
  let in_lower_bound = min <= x
      in_upper_bound = max >= x
  in
    in_lower_bound && in_upper_bound

-- Function (where) with saving variable to be used inside the function
in_range4 min max x = ilb && iub
  where
    ilb = min <= x
    iub = max >= x

-- Function (where) with saving variable to be used inside the function + if then else
in_range5 min max x =
  if ilb then iub else False
  where
    ilb = min <= x
    iub = max >= x

-- Recursion
fac n = trace ("n =" ++ show n) $
  if n <= 1 then
    1
  else
    n * fac (n-1)


-- Guards
fac2 n
  |  n <= 1 =1
  |  otherwise = trace ("n =" ++ show n) $ n * fac (n-1)

-- Pattern Matching
is_zero 0 = True
is_zero _ = False

-- Accumulators
fac3 n = aux n 1 
  where
    aux n acc
      |  n <= 1 = acc
      |  otherwise = aux (n-1) (n*acc)

asc :: Int -> Int -> [Int]
asc n m
  |  m < n = []
  |  m == n = [m]
  |  m > n = n : asc (n+1) m

evens :: [Int] -> [Int]
evens [] = []
evens (x:xs)
  |  mod x 2 == 0 = x : evens xs
  |  otherwise = evens xs

-- Tuples
addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [ x+y | (x,y) <- xs ]

-- Exercise
-- Q1: Create a function elemmm that returns True if an element is in a given list and returns False otherwise
elemm :: (Eq a) => a -> [a] -> Bool
elemm _ [] = False
elemm e (x:xs) = (e == x) || (elemm e xs)

-- Note: elem is an inbuilt function so the solution defining elem as function does not work here.

elemmm e (x:xs)
  |  e == x = True
  |  length (x:xs) == 1 = False
  |  otherwise = elemmm e xs

-- Q2: Create a function nub that removes all duplicates from a given list
nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x:xs)
  |  elem x xs = nub xs
  |  otherwise = x : nub xs

-- Q3: Create a function isAsc that returns True if the list given to it is a list of ascending order
isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [x] = True
isAsc (x:y:xs) = x <= y && isAsc (y:xs)

-- Q4:  
hasPath :: [(Int,Int)] -> Int -> Int -> Bool
hasPath [] x y = x == y
hasPath xs x y 
  |  x == y = True
  |  otherwise = 
    let xs' = [ (n,m) | (n,m) <- xs, n /= x ] in
    or [ hasPath xs' m y | (n,m) <- xs, n == x ]
      

-- hasPath [(1,2),(2,3),(3,2),(4,3),(4,5)] 1 3

