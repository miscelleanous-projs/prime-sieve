# Quick and Dirty Prime Sieve

I've searched the Github site using `prime sieve language:D` and found out to my surprise that there is one and only one repository dating back to 2015 meeting the criteria.

This repo is for everyone loving Dlang like me... in search of simple prime sieve code example to study. Enjoy!

## Source code

```D
import std.stdio;
import std.range;
import std.math;
import std.algorithm;
import std.traits;

bool isPrime(T)(T n) if (isIntegral!T) {
    if (n < T(2)) return false;

    if (n == T(2) || n == T(3)) return true;
    if (n % T(2) == 0 || n % T(3) == 0) return false;

    foreach (i; iota(cast(T)5, cast(T)sqrt(cast(float)n) + 1, T(6))) {
        if (n % i == 0 || n % (i + T(2)) == 0) return false;
    }

    return true;
}

void main() {
    (iota(100).filter!isPrime).writeln;
}
```

## Output

```
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
```


