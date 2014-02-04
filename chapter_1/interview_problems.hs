
module IntegerDivision where

import Control.Monad (forM_)
import Control.Exception (evaluate)
import Data.Bits (shiftL, shiftR)
import Test.Hspec

main :: IO ()
main = hspec $ do
  let cases = [(0,1), (1,2), (2,1), (9,4), (18457,11), (100000000000,1)]

  describe "dividing positive integers" $ do
    forM_ cases $ \(n,d) ->
      it ("divides " ++ show n ++ " by " ++ show d) $ do
        divide' n d `shouldBe` divMod n d

  describe "dividing by zero" $ do
    it "should raise an error" $ do
      evaluate (divide' 1 0) `shouldThrow` anyErrorCall

--
-- 1-28: [5] Write a function to perform integer division without either
-- the / or * operators. Find a fast way to do it.
--

-- the slow, recursive subtraction foundation
divide :: Int -> Int -> (Int,Int)
divide _ 0 = divByZeroError
divide x y = d x y 0
  where
    d num den times
      | num < den = (times, num)
      | otherwise = d (num - den) den (times + 1)

-- the insanely-faster bit-shifting re-implementation
divide' :: Int -> Int -> (Int,Int)
divide' _ 0 = divByZeroError
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

divByZeroError :: a
divByZeroError = error "tried to divide by 0"

-- 1-30: [3] How man piano tuners are there in the world
-- Not many? WTF?
