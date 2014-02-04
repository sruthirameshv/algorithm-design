-- 1-28: [5] Write a function to perform integer division without either
-- the / or * operators. Find a fast way to do it.

module IntegerDivision where

import Data.Bits (shiftL, shiftR)

-- the slow, recursive subtraction foundation
divide :: Int -> Int -> (Int,Int)
divide x y = d x y 0
  where
    d num den times
      | num < den = (times, num)
      | otherwise = d (num - den) den (times + 1)

-- the insanely-faster bit-shifting re-implementation
divide' :: Int -> Int -> (Int,Int)
divide' x y = d x y 0 0
  where
    d num den times shifts
      | num < den  = if shifts > 0
                     then d num (shiftR den 1) times (shifts - 1)
                     else (times, num)
      | num < den' = d (num - den) den (times + shiftL 1 shifts) shifts
      | otherwise  = d num den' times (shifts + 1)
      where
        den' = shiftL den 1

-- 1-30: [3] How man piano tuners are there in the world
-- Not many? WTF?
