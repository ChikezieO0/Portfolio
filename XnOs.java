import java.util.*;

public class XnOs 
{
    public static void main(String[] args)
    {

        String[] xo = {"1","2","3","4","5","6","7","8","9"};
        int turn=11;
        System.out.println("Pick the number you want the place your X or O");
        System.out.println("X goes first");
        System.out.println("| "+xo[0]+" | "+xo[1]+" | "+xo[2]+" |");
        System.out.println("-------------");
        System.out.println("| "+xo[3]+" | "+xo[4]+" | "+xo[5]+" | ");
        System.out.println("-------------");
        System.out.println("| "+xo[6]+" | "+xo[7]+" | "+xo[8]+" |");
        Scanner sc = new Scanner(System.in);
        int val;
        int val1;

//----------------------------------Game Logic-----------------------------------------------------------------------------------------
        for(int i=0;i<xo.length;i++)
        {
            turn=sc.nextInt();
            val = turn-1;
            val1 = 0;

            if(xo[val] == "X" || xo[val] == "O")
            {
                System.out.println("CAN'T PLACE IN THE SAME SQUARE TWICE!!!!!");
                i--;
            }
            if(xo[val] != "X" || xo[val] != "O")
            {
                val1 = Integer.parseInt(xo[val]);
            }
            
            if(turn==val1&& i%2==0)
            {
                xo[val]="X";
            }
            //replaces number with X
            if(turn==val1&& i%2==1)
            {
                xo[val]="O";
            }
            // replaces with O

//----------------------------------------------- Checking for winners----------------------------------------------------------------------
            if(i>3)
            {
                if(xo[0] == xo[3] && xo[3] == xo[6])
                {
                    System.out.println(xo[0]+ " Wins!!!!!");
                    break;
                }
                if(xo[1] == xo[4] && xo[4] == xo[7])
                {
                    System.out.println(xo[1]+ " Wins!!!!!");
                    break;
                }
                if(xo[2] == xo[5] && xo[5] == xo[8])
                {
                    System.out.println(xo[2]+ " Wins!!!!!");
                    break;
                }
//---------------------------------------------------------------------------------------------------------------
                if(xo[0] == xo[1] && xo[1] == xo[2])
                {
                    System.out.println(xo[0]+ " Wins!!!!!");
                    break;
                }
                if(xo[3] == xo[4] && xo[4] == xo[5])
                {
                    System.out.println(xo[4]+ " Wins!!!!!");
                    break;
                }
                if(xo[6] == xo[7] && xo[7] == xo[8])
                {
                    System.out.println(xo[7]+ " Wins!!!!!");
                    break;
                }
//----------------------------------------------------------------------------------------------------------------------
                if(xo[0] == xo[4] && xo[4] == xo[8])
                {
                    System.out.println(xo[0]+ " Wins!!!!!");
                    break;
                }
                if(xo[2] == xo[4] && xo[4] == xo[6])
                {
                    System.out.println(xo[4]+ " Wins!!!!!");
                    break;
                }
//----------------------------------------------- Game Board ----------------------------------------------------------------------
            }
            System.out.println("| "+xo[0]+" | "+xo[1]+" | "+xo[2]+" |");
            System.out.println("-------------");
            System.out.println("| "+xo[3]+" | "+xo[4]+" | "+xo[5]+" | ");
            System.out.println("-------------");
            System.out.println("| "+xo[6]+" | "+xo[7]+" | "+xo[8]+" |");
        }     
    }
}
