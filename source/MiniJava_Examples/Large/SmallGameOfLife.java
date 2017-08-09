class SmallGameOfLife {
    public static void main(String[] a){
	     System.out.println(new PrimeNumbers().start());
    }
}


class PrimeNumbers {
    int [] primes;
    int len;

    public int start() {
      boolean ok;
      primes = new int [4];
      primes[0] = 1;
      primes[1] = 2;
      primes[2] = 3;
      primes[3] = 5;
      ok = this.isprime(7);
      return 99;
    }

    public int gcd (int x, int y) {
    	int res;
    	if (x<y) {
    	    res = this.gcd(y,x);
    	} else if (y<1) {
    	    res = x;
    	} else {
    	    res = this.gcd(y,x-y);
    	}
    	return res;
        }

    // isprime(n) = true   if n is prime relatively to all primes[0..len-1]
    public boolean isprime (int n) {
      int i;
      int p;
      boolean ok;   // is still prime?
      boolean cont; // continue loop
      ok   = true;
      cont = true;
      i = 0;
      while (ok && (i<4) && cont) {
	       p = primes[i];
        ok = ok && this.gcd(p,n) < 2; // p and n have no common divisor > 1
	       i=i+1;
        cont = p * p < n; // no need to continue if n greater sqrt(p)
      }
      return ok;
    }
}