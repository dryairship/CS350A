## Monadic Laws

The Monadic Laws are:
1. Left Identity:     `return a >>= f   =   f a`
2. Right Identity:    `m >>= return     =   m`
3. Associativity:     `m >>= f >>= g    =   m >>= (\x -> f x >>= g)`

## Maybe monad

The functions `return` and `(>>=)` of the Maybe monad are defined as follows:  
(source: https://hackage.haskell.org/package/base-4.12.0.0/docs/src/GHC.Base.html#line-854)

 - `(>>=)` function:
```
(Just x) >>= k      = k x
Nothing  >>= _      = Nothing
```

 - `return` function:
```
pure = Just
return = pure
```
(This simply means that `return x = Just x`).

**Note**: In the following proofs, we will begin with the LHS of the statements of the Monadic Laws, and then transform it using the properties of the Maybe monad, and finally show that it is equivalent to the RHS of the law.

## Satisfiability of Law 1 (Left Identity)
```
LHS = return a >>= f
    = Just a >>= f     (from the definition of return function for Maybe)
    = f a              (from the definition of (>>=) function for Just a)
    = RHS
```
So the Maybe monad satisfies Law 1.

## Satisfiability of Law 2 (Right Identity)
Here we have 2 cases:
 - When `m` is Nothing:
```
LHS = m >>= return
    = Nothing >>= return   (as m = Nothing)
    = Nothing              (from the definition of (>>=) function for Nothing)
    = m                    (as m = Nothing)
    = RHS
```
 - When `m` is `Just x` for some `x`:
```
LHS = m >>= return
    = Just x >>= return    (as m = Just x)
    = return x             (from the definition of (>>=) function for Just x)
    = Just x               (from the definition of return function for Maybe)
    = m                    (as m = Just x)
    = RHS
```

So the Maybe monad satisfies Law 2.

## Satisfiability of Law 3 (Associativity)
Here we have 2 cases:

 - When `m` is Nothing:
```
LHS = m >>= f >>= g
    = Nothing >>= f >>= g   (as m = Nothing)
    = Nothing >>= g         (Nothing >>= f = Nothing, from the definition of (>>=) function for Nothing)
    = Nothing               (Nothing >>= g = Nothing, from the definition of (>>=) function for Nothing)

RHS = m >>= (\x -> f x >>= g)
    = m >>= h                 (define h = (\x -> f x >>= g))
    = Nothing >>= h           (as m = Nothing)
    = Nothing                 (Nothing >>= h = Nothing, from the definition of (>>=) function for Nothing)
```
So LHS = RHS.

 - When `m` is `Just x` for some `x`:
```
LHS = m >>= f >>= g
    = Just x >>= f >>= g   (as m = Just x)
    = f x >>= g            (from the definition of (>>=) function for Just x)

RHS = m >>= (\y -> f y >>= g)
    = Just x >>= (\y -> f y >>= g)   (as m = Just x)
    = (\y -> f y >>= g) x            (from the definition of (>>=) function for Just x)
    = f x >>= g                      (beta reduction)
```
So LHS = RHS.

Hence, the Maybe monad satisfies Law 3.


## Conclusion

The `Maybe` monad satisifes all 3 monadic laws.
