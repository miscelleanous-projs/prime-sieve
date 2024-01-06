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