import java.util.Scanner;

public class LeerDatos {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        //Pedir al usuario que introduzca un numero por teclado
        System.out.println("Introduce un numero entero ");

        int numero = scanner.nextInt();
        System.out.println("El numero introducido es = " + numero);

        scanner.close();
    }
}
