class Factorial{
    public static void main(String[] a){
	System.out.println(new Fac().ComputeFac(10));
    }
}

class Fac {

    public int ComputeFac(int num){
	int num_aux ;
	if (num < 1)
	    num_aux = 1 ;
	else 
////////////////////////////// ERROR HERE //////////////////////////////
	    num_aux = num * (this.computeFac(num-1)) ;
//////////////////////////////////////////////////////////////////////
	return num_aux ;
    }

}