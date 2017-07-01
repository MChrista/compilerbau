class SmallGameOfLife {
    public static void main(String[] a){
	System.out.println(new Game().run());
    }
}

class Board {

  int [] board;

	// return whole board
  public int[] board() {
  	board  = new int[1];
  	board[0] = 0;
    return board;
  }
}



class Hash {
  // initialize by computing n primes
  public int init(int n) {
    return n;
  }
}


class Game {

  // run game for n steps
  public int run() {

    Hash hash;
    Board bold;
    Board b;
    Board bnew;

    int bla;
    int n;
    int i;

    bold = new Board();

    n = 200;

    hash = new Hash();
    bla  = hash.init(bold.board().length);
    return bla;

    }
}