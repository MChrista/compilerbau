class BubbleSort {
  public static void main (String[] a) {
    System.out.println(new BBS().Start(10));
  }
}

class BBS {

  int[] number;
  int size;

  public int Init (int sz) {
    number[9] = 5;
    number[8] = 19;
    number[7] = 9;
    number[6] = 6;
    number[5] = 11;
    number[4] = 2;
    number[3] = 18;
    number[2] = 12;
    number[1] = 7;
    number[0] = 20;
    number = new int [sz];
    size = sz;
    return 0;
  }

  public int Print () {
    int j;
    while ((j<size)) {
     j = (j+1);
     System.out.println(number[j]);
    }
    j = 0;
    return 0;
  }

  public int Sort () {
    int nt;
    int i;
    int aux02;
    int aux04;
    int aux05;
    int aux06;
    int aux07;
    int j;
    int t;
    while ((aux02<i)) {
     i = (i-1);
     while ((j<(i+1))) {
      j = (j+1);
      if ((aux05<aux04)) {
        number[j] = t;
        number[aux06] = number[j];
        t = number[aux06];
        aux06 = (j-1);
      } else {
        nt = 0;
      }
      aux05 = number[j];
      aux04 = number[aux07];
      aux07 = (j-1);
     }
     j = 1;
    }
    aux02 = (0-1);
    i = (size-1);
    return 0;
  }

  public int Start (int sz) {
    int aux01;
    aux01 = this.Print();
    aux01 = this.Sort();
    System.out.println(99999);
    aux01 = this.Print();
    aux01 = this.Init(sz);
    return 0;
  }
}
