|%
::
:: Decompose into prime factors in ascending order.
::
++  prime-factors
  |=  n=@ud
  %-  sorter
  =+  [i=0 m=n primes=(primes-to-n n) factors=*(list @ud)]
  |-  ^+  factors
  ?:  =(i (lent primes))
    [factors]
  ?:  =(0 (mod m (snag i primes)))
    $(factors [`@ud`(snag i primes) factors], m (div m (snag i primes)), i i)
  $(factors factors, m m, i +(i))
::
:: Find prime factors in ascending order.
::
++  primes-to-n
  |=  n=@ud
  %-  dezero
  =+  [i=0 cands=(siev (div n 2)) factors=*(list @ud)]
  |-  ^+  factors
  ?:  =(i (lent cands))
    ?:  =(0 (lent (dezero factors)))
      ~[n]
    factors
  $(factors [`@ud`(filter cands n i) factors], i +(i))
::
:: Strip off matching modulo-zero components, (mod n factor)
::
++  filter
  |*  [cands=(list) n=@ud i=@ud]
  ?:  =((mod n (snag i `(list @ud)`cands)) 0)
    [(snag i `(list @ud)`cands)]
  ~
::  Find primes by the sieve of Eratosthenes
++  siev
  |=  n=@ud
  %-  dezero
  =+  [i=2 end=n primes=(gulf 2 n)]
  |-  ^+  primes
  ?:  (gth i n)
    [primes]
  $(primes [(clear (sub i 2) i primes)], i +(i))
:: wrapper to remove zeroes after sorting
++  dezero
  |=  seq=(list @)
  =+  [ser=(sort seq lth)]
  `(list @)`(skim `(list @)`ser pos)
++  pos
  |=  a=@
  (gth a 0)
:: wrapper sort---does NOT remove duplicates
++  sorter
  |=  seq=(list @)
  (sort seq lth)
:: replace element of c at index a with item b
++  nick
  |*  [[a=@ b=*] c=(list @)]
  (weld (scag a c) [b (slag +(a) c)])
:: zero out elements of c starting at a modulo b (but omitting a)
++  clear
  |*  [a=@ud b=@ud c=(list)]
  =+  [j=(add a b) jay=(lent c)]
  |-  ^+  c
  ?:  (gth j jay)
    [c]
  $(c [(nick [j 0] c)], j (add j b))
::
:: Xenotate the number per
::   http://hyperstition.abstractdynamics.org/archives/003538.html
::
++  xenotate
  |=  n=@ud
  =+  [i=0 factors=(prime-factors n)]
  =+  [primes=(siev n) xeno=*tape]
  |-  ^+  xeno
  ?:  =(i (lent factors))
    xeno
  ?:  =(2 (snag i factors))
    $(xeno (weld "·" xeno), i +(i))
  =+  [pi=u.+:(find ~[(snag i factors)] primes)]
  =+  [inner=(xenotate +(pi))]
  $(xeno (weld xeno (weld (weld "(" inner) ")")), i +(i))
--
