// a*b = LCM * GCD
// LCM = a*b/GCD

func gcd(a: Int, b: Int) -> Int
{
    if a == 0 {
        return b
    }
    return gcd(a: b % a, b: a)
}
