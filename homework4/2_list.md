## Monadic Laws

The Monadic Laws are:
1. Left Identity:     `return a >>= f   =   f a`
2. Right Identity:    `m >>= return     =   m`
3. Associativity:     `m >>= f >>= g    =   m >>= (\x -> f x >>= g)`

## List monad

The functions `return` and `(>>=)` of the List monad are defined as follows:  
(source: https://hackage.haskell.org/package/base-4.12.0.0/docs/src/GHC.Base.html#line-984)

 - `(>>=)` function:
```
xs >>= f = [y | x <- xs, y <- f x]
```

 - `return` function:
```
pure x = [x]
return = pure
```
(This simply means that `return x = [x]`).

**Note**: In the following proofs, we will begin with the LHS of the statements of the Monadic Laws, and then transform it using the properties of the List monad, and finally show that it is equivalent to the RHS of the law.

## Satisfiability of Law 1 (Left Identity)
```
LHS = return a >>= f
    = [a] >>= f                  (from the definition of return function for List monad)
    = [y | x <- [a], y <- f x]   (from the definition of (>>=) function for List monad)
    = [y | y <- (f a)]           (simplification, note that (f a) is a list)
    = f a                        (simplification, [y | y <- xs] = xs)
    = RHS
```
So the List monad satisfies Law 1.

## Satisfiability of Law 2 (Right Identity)
We know that `m` is a list. So let it be any generic list `[a, b, c, ...]`.
```
LHS = m >>= return
    = [a, b, c, ...] >>= return                                    (as m = [a, b, c, ...])
    = [y | x <- [a, b, c, ...], y <- return x]                     (from the definition of (>>=) function for List monad)
    = [y | y <- ((return a) ++ (return b) ++ (return c) ++ ...) ]  (simplification, note that (return x) is a list)
    = [y | y <- ([a] ++ [b] ++ [c] ++ ...) ]                       (from the definition of return function for List monad)
    = [y | y <- [a, b, c, ...] ]                                   (simplification, joining lists using the ++ function)
    = [a, b, c ...]                                                (simplification, [y | y <- xs] = xs)
    = m                                                            (as m = [a, b, c, ...])
    = RHS
```

So the List monad satisfies Law 2.

## Satisfiability of Law 3 (Associativity)
We know that `m` is a list. So let it be any generic list `[a, b, ...]`.
Further, let `f x = [x1, x2, ...]` for any `x`.
```
LHS = m >>= f >>= g
    = [a, b, ...] >>= f >>= g                                            (as m = [a, b, ...])
    = [y | x <- [a, b, ...], y <- f x] >>= g                             (from the definition of (>>=) function for List monad)
    = [y | y <- ((f a) ++ (f b) ++ ...) ] >>= g                          (simplification, note that (f x) is a list)
    = ((f a) ++ (f b) ++ ...) >>= g                                      (simplification, [y | y <- xs] = xs)
    = ([a1, a2, ...] ++ [b1, b2, ...] ++ ...) >>= g                      (as f x = [x1, x2, ...])
    = [a1, a2, ..., b1, b2, ...] >>= g                                   (simplification, joining lists using the ++ function)
    = [y | x <- [a1, a2, ..., b1, b2, ...], y <- g x]                    (from the definition of (>>=) function for List monad)
    = [y | y <- ((g a1) ++ (g a2) ++ ... ++ (g b1) ++ (g b2) ++ ...)]    (simplification, note that (g x) is a list)
    = ((g a1) ++ (g a2) ++ ... ++ (g b1) ++ (g b2) ++ ...)               (simplification, [y | y <- xs] = xs)

RHS = m >>= (\y -> f y >>= g)
    = [a, b, ...] >>= (\y -> f y >>= g)                                                        (as m = [a, b, ...])
    = [z | x <- [a, b, ...], z <- (\y -> f y >>= g) x]                                         (from the definition of (>>=) function for List monad)
    = [z | x <- [a, b, ...], z <- (f x >>= g)]                                                 (beta reduction)
    = [z | z <- ((f a >>= g) ++ (f b >>= g) ++ ...)]                                           (simplification, note that (f x >> g) is a list)
    = ((f a >>= g) ++ (f b >>= g) ++ ...)                                                      (simplification, [y | y <- xs] = xs)
    = [y | x <- [a1, a2, ...], y <- g x] ++ [y | x <- [b1, b2, ...], y <- g x] ++ ...          (from the definition of (>>=) function for List monad)
    = [y | y <- ((g a1) ++ (g a2) ++ ...)] ++ [y | y <- ((g b1) ++ (g b2) ++ ...)] ++ ...      (simplification, joining lists using the ++ function)
    = ((g a1) ++ (g a2) ++ ...) ++ ((g b1) ++ (g b2) ++ ...) ++ ...                            (simplification, [y | y <- xs] = xs)
    = ((g a1) ++ (g a2) ++ ... ++ (g b1) ++ (g b2) ++ ...)                                     (simplification, joining lists using the ++ function)
```
So LHS = RHS.

Hence, the List monad satisfies Law 3.


## Conclusion

The `List` monad satisifes all 3 monadic laws.
