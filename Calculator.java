import java.util.*;

public class Calculator
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        double r = 0.0;
        System.out.println("Enter the two numbers you want to calculate.");
        double n1 = sc.nextDouble();
        double n2 = sc.nextDouble();
        System.out.println("Enter the operator you want to use, '-','+','/','x'");
        char op = sc.next().charAt(0);

        switch(op)
        {
            case '+':
            r = n1 + n2;
            System.out.println(n1+" + " +n2+ " = "+r);
            break;

            case '/':
            r =n1/n2;
            System.out.println(n1+" / "+n2+" = "+r);
            break;
            case 'x':
            r = n1 * n2;
            System.out.println(n1+" x " +n2+ " = "+r);
            break;

            case '-':
            r =n1-n2;
            System.out.println(n1+" - "+n2+" = "+r);
            break;

            default:
            System.out.println("Invalid Input");
            break;
        }
    }
}