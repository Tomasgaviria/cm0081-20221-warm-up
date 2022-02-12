module Main where
import Numeric.Natural

 main :: IO ()
fac1 :: Natural -> Natural
fac1 n = if n == 0 
           then 1
           else n * fac1 (n-1)
{-This function receives the parameter n, a number. The
first thing it does is defining what the base case solution
is, then this function defines recursively the factorial 
operation, this function returns the result of the factorial-}


fac2 :: Natural -> Natural
fac2 0 = 1
fac2 n = n * fac2 (n-1)
{-This fuction receives a number and asks if this number 
is equal to 0, when this happens this factorial is defined
in the first line, then the factorial operation is defined
recursively-}

fac3 :: Natural -> Natural
fac3 = foldr (*) 1 . enumFromTo 1
{-This function receives natural number and returns another
natural number (the result of the factorial) using the haskell
functions foldr and enumFromTo-}


fac4 :: Natural -> Natural
fac4 n = foldr (*) 1 [1..n]
{-This function calls a haskell function called foldr which 
allows the factorial to be solved by step by step multiply
the numbers of [1..n](). This function receives the parameter 
n and returns its factorial-}

{-References:

()https://hackage.haskell.org/package/base-4.16.0.0/docs/Prelude.html#v:enumFromTo
()http://zvon.org/other/haskell/Outputprelude/foldr_f.html-}
