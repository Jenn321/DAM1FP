import java.util.Scanner;

public class NumeroPositivoNegativo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Introduce un número entero: ");

        int numero = scanner.nextInt();
        scanner.close();

        if(numero==0) {
           System.out.println("El numero es cero");
        } else if (numero>0) {
            System.out.println("El numero es positivo");
        } else {
            System.out.println("El numero es negativo");
        }

    }
    }

