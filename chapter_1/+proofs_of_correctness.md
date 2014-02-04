# 1-7: [3] Prove the correctness of the following recursive algorithm to multiply two natural numbers, for all integer constants c ≥ 2

    function multiply(y,z)
      comment: Return the product yz
        1. if z = 0 then return(0) else
        2. return(multiply(cy, ⌊z/c⌋) + y * (z mod c))

## Proof:

- for case c >= 2, y >= 0, z = 0 should = 0 (this is obviously correct)
- for case c >= 2, y >=0, z = n + 1 should = y(n + 1)

    A = multiply(cy, ⌊(n + 1)/c⌋)
    B = y * ((n + 1) mod c)

    A + B must = y(n + 1)

    A = 
