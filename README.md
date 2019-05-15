# Xenotation

Various xenotation converters of my own device.

## Python

For instance, the Python version's usage is:

    python xenotation.py n

where `n` is an integer greater than 1.

Inspired by [`jpt4`'s `tic-xenotation`](https://github.com/jpt4/tic-xenotation), which, as of this writing, runs from xenotation to Arabic numbers, the opposite way.

It's ugly, it's quick-and-dirty, it's wasteful, it's missing test cases, but it seems to work.  The primes list tops out at the 100th prime, but could be expanded.  (There's a crossover point where it's faster to load primes than calculate them, but I didn't bother to calculate all primes, favoring loading them from disk instead.)

## APL

This xenotation is compatible with Dyalog APL.

References:

-   [Hyperstition, "The Tic Xenotation](http://hyperstition.abstractdynamics.org/archives/003538.html)
-   [Hyperstition, "TX2"](http://hyperstition.abstractdynamics.org/archives/005047.html)


