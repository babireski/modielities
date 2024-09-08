module Continuation where

newtype Continuation r a = Continuation {continuation :: (a -> r) -> r}

instance Functor (Continuation r) where
    fmap :: (a -> b) -> Continuation r a -> Continuation r b
    fmap f (Continuation c) = Continuation $ \k -> c (k . f)

instance Applicative (Continuation r) where
    pure :: a -> Continuation r a
    pure x = Continuation $ \k -> k x
    (<*>) :: Continuation r (a -> b) -> Continuation r a -> Continuation r b
    (Continuation f) <*> (Continuation v) = Continuation $ \k -> f (\g -> v (k . g))

instance Monad (Continuation r) where
    (>>=) :: Continuation r a -> (a -> Continuation r b) -> Continuation r b
    (Continuation m) >>= f = Continuation $ \k -> m (\a -> continuation (f a) k)