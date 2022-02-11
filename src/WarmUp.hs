module Main where
import Numeric.Natural

 main :: IO ()
fac1 n = if n == 0 
           then 1
           else n * fac1 (n-1)

fac2 0 = 1
fac2 n = n * fac2 (n-1)

{-fac3s = scanl (*) 1 [1..]
fac3 n = fac3s !! n-}
