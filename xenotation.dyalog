⍝∇/∆ APL XENOTATION ∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆\∇/∆

⍝ Generate a list of prime factors. ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
Prime←{1↓(~v∊1 1↓v∘.×v)/v←⍳(⍵+1)}

⍝ We need the full decomposition, not just the prime factors.  (Rosetta Code) ⍝
∇ PrimeFactorDecomposition←{⎕ML ⎕IO←1          ⍝ Prime factors of ⍵.
    ⍵{                      ⍝ note: ⎕wa>(⍵*÷2)×2*4.
        ⍵,(⍺÷×/⍵)~1         ⍝ append factor > sqrt(⍵).
    }∊⍵{                    ⍝ concatenated,
        (0=(⍵*⍳⌊⍵⍟⍺)|⍺)/⍵   ⍝ powers of each prime factor.
    }¨⍬{                    ⍝ remove multiples:
        nxt←⊃⍵              ⍝ next prime, and
        msk←0≠nxt|⍵         ⍝ ... mask of non-multiples.
        ∧/1↓msk:⍺,⍵         ⍝ all non multiples - finished.
        (⍺,nxt)∇ msk/⍵      ⍝ sieve remainder.
    }⍵{                     ⍝ from,
        (0=⍵|⍺)/⍵           ⍝ divisors of ⍵ in:
    }2,(1+2×⍳⌊0.5×⍵*÷2),⍵   ⍝ 2,3 5 .. sqrt(⍵),⍵
}
∇

⍝ Find the xenotative form of a number. ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
∇ Xeno←Xenotate n
  ⍝ Find prime factors of an Arabic-style number.
  Factors ← PrimeFactorDecomposition n
  ⍝ Use the prime indices in the generation of the xenotative number.
  Primes ← Prime 1000

  ⍝ Construct xenotative form of each prime factor.
  ⍝ This can probably be made more APL-like.
  Xeno ← ''
  :For Factor :In Factors
    :If Factor = 2      ⍝ Add ':'
      Xeno←Xeno,':'
    :Else              ⍝ Implex
      PrimeIndex ← (Factor ⍷ Primes) / ⍳⍴Primes
      InnerValue ← Xenotate( PrimeIndex )
      Xeno←Xeno,'(',InnerValue,')'
    :EndIf
  :EndFor
∇
