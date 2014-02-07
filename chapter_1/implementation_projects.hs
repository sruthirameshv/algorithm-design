module ImplementationProjects where

-- 1-26: [5] Implement the two TSP heuristics of Section 1.1 (page 5). Which
-- of them gives better-quality solutions in practive? Can you devise a
-- heuristic that works better than both of them?

import Data.List (sortBy, delete)
import qualified Data.Map as M
import Test.Hspec

type Point = (Float,Float)

byNearest :: Point -> [Point] -> [Point]
byNearest _ []     = []
byNearest orig pts = next : byNearest next rem
  where
    (next : rem) = sortBy (compDistFrom orig) pts

byPairs :: Point -> [Point] -> [Point]
byPairs _ []     = []
byPairs orig pts = byPairs' orig (vertexChains pts)
  where
    byPairs' orig chains
      | M.null chains = []
      | otherwise     = orig : byPairs' next (M.delete orig remChains)
      where
        remChains = M.map (delete orig) chains
        next      = head $ remChains M.! orig

-- this obviously is the correct definition of a vertex chain
-- so what the hell is?
vertexChains :: [Point] -> M.Map Point [Point]
vertexChains pts = M.fromList $ map (\x -> (x, sortBy (compDistFrom x) pts)) pts

compDistFrom :: Point -> Point -> Point -> Ordering
compDistFrom orig pt1 pt2 = compare (dist pt1 orig) (dist pt2 orig)

dist :: Point -> Point -> Float
dist (a,b) (x,y) = sqrt $ (x-a)^2 + (y-b)^2

main :: IO ()
main = hspec $ do
  describe "travelling salesman problem heuristics" $ do
    describe "finding the nearest neigbhors" $ do
      it "finds the nearest neighbors vertically" $ do
        let pts = [(0,-5), (0,-1), (0,0), (0,2)]
        byNearest (0,0) pts `shouldBe` [(0,0), (0,-1), (0,2), (0,-5)]

      it "finds the nearest neighbors horizontally" $ do
        let pts = [(-5,0), (-1,0), (0,0), (2,0)]
        byNearest (0,0) pts `shouldBe` [(0,0), (-1,0), (2,0), (-5,0)]
