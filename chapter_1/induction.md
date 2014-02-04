# 1-10: [3] Prove that [summation i=1] i = n(n + 1)/2 for n >= 0, by induction

- for case n = 0, 0 = obviously 0
- assume it's true for case n = n
- for case n = n + 1, roll out the largest term...

    (n + 1) + n(n + 1)/2 = (n + 1)(n + 2)/2
    2(n + 1) + n(n + 1)  = (n + 1)(n + 2)
    2n + 2 + n^2 + n     = n^2 + n + 2n + 2
    n^2 + 3n + 2         = n^2 + 3n + 2

# 1-12: [3] Prove that [summation i=1] i^3 = n^2 * (n + 1)^2/4 for n >= 0, by induction

- for case n = 0, 0 = obviously 0
- assume it's true for case n = n
- for case n = n + 1, roll out the largest term

    (n + 1)^3 + n^2 * (n + 1)^2/4                  = (n + 1)^2 * (n + 2)^2/4
    4(n + 1)^3 + n^2 * (n^2 + 2n + 1)              = (n^2 + 2n + 1) * (n^2 + 4n + 4)
    4(n + 1)(n^2 + 2n + 1) + n^2 * (n^2 + 2n + 1)  = (n^2 + 2n + 1) * (n^2 + 4n + 4)
    4(n + 1) + n^2                                 = (n^2 + 4n + 4)
    n^2 + 4n + 4                                   = n^2 + 4n + 4

