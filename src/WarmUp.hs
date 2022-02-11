module Main where
import Numeric.Natural

 main :: IO ()
fac n = if n == 0 
           then 1
           else n * fac (n-1)
{-This function receives the parameter n, a number. The first thing it does is defining 
what the base case solutionis, then this function defines recursively the factorial 
operation, this function returns the result of the factorial-}

fac2 0 = 1
fac2 n = n * fac2 (n-1)
{-This fuction receives a number and asks if this number is equal to 0, when this 
happens this factorial is definedin the first line, then the factorial operation is defined
recursively-}

fac3  0    =  1
fac3 (n+1) = (n+1) * fac3 n
{-This function receives a number which is at first compared to 0, the base case. Then a 
definition of the factorialof n+1 is given, making this a recursive function-}

fac4 n = foldr (*) 1 [1..n]
{-This function calls a haskell function called foldr which allows the factorial to be solved 
by step by step multiply the numbers of [1..n](1). This function receives the parameter n and 
returns its factorial-}
