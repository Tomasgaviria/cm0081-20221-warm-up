module Main where
import Numeric.Natural
import Test.QuickCheck
import Test.QuickCheck.Arbitrary()

instance Arbitrary Natural where
 arbitrary = arbitrarySizedNatural
 shrink = shrinkIntegral

main :: IO()
main = quickCheck $ prop_fac[fac1, fac2, fac3, fac4, fac5]

prop_fac :: [Natural -> Natural] -> Natural -> Bool 
prop_fac [] a = True 
prop_fac (x:xs) a = aux (x) a && prop_fac (xs) a

--This function takes a given list of functions and compares it whit one
--already defined function "aux". Recursively it calls itself once again 
--just until the list is empty. 

aux :: (Natural -> Natural) -> Natural -> Bool  
aux l a = l a == fac a

--This is an auxiliar function to compare the fac funcionts whit
--the base factorial function


fac :: Natural -> Natural
fac n = product [1..n]   {-(1)-}

fac1 :: Natural -> Natural 
fac1 = (\(n) ->
        (if ((==) n 0)
            then 1
            else ((*) n (fac1 ((-) n 1)))))
--This function recives a natural number n, when n = 0, 
--the function will return 1. when n is different to 0 
--it will return the product of the number n times fac1 n-1 until n = 0.


fac2 :: Natural -> Natural
fac2 n = if n == 0 
           then 1
           else n * fac2 (n-1)  {-(2)-}
--This function receives the parameter n, a number. The
--first thing it does is defining what the base case solution
--is, then this function defines recursively the factorial 
--operation, this function returns the result of the factorial


fac3 :: Natural -> Natural
fac3 0 = 1
fac3 n = n * fac3 (n-1)  {-(2)-}
--This fuction receives a number and asks if this number 
--is equal to 0, when this happens this factorial is defined
--in the first line, then the factorial operation is defined
--recursively

fac4 :: Natural -> Natural
fac4 = foldr (*) 1 . enumFromTo 1  {-(2)-}
--This function receives natural number and returns another
--natural number (the result of the factorial) using the haskell
--functions foldr and enumFromTo. foldr allows the factorial to be 
--solved by step by step multiply the numbers that enumFromTo function generates.
--enumFromTo creates a list of the numbers starting in the first parameter you give
--and ending in the second parameter(3)


fac5 :: Natural -> Natural
fac5 n = foldr (*) 1 [1..n]  {-(2)-}
--This function calls a haskell function called foldr which 
--allows the factorial to be solved by step by step multiply
--the numbers of [1..n](4). This function receives the parameter 
--n and returns its factorial

-------------------------------------------------------------------------------------

--References:
--(1)Programming Labs Warm-Up(pdf)
--(2)http://www.willamette.edu/~fruehr/haskell/evolution.html
--(3)https://hackage.haskell.org/package/base-4.16.0.0/docs/Prelude.html#v:enumFromTo
--(4)http://zvon.org/other/haskell/Outputprelude/foldr_f.html
