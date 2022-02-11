instance Arbitrary Natural where
 arbitrary = arbitrarySizedNatural
 shrink = shrinkIntegral
 main :: IO ()
main = quickCheck $ prop_fac [fac , fac2]

fac n = if n == 0 
           then 1
           else n * fac (n-1)

fac2 0 = 1
fac2 n = n * fac2 (n-1)

{-fac3s = scanl (*) 1 [1..]
fac3 n = fac3s !! n-}
