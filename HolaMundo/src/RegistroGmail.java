import java.util.Scanner;

public class RegistroGmail {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Introduce tu edad: ");

        int edad = scanner.nextInt();

        if (edad>=14)
        {System.out.println("Puedes crear una cuenta de Gmail");}
        else {
            System.out.println("Eres menor de 14 años, no puedes crear una cuenta por ti mismo.");
        }
        scanner.close();
    }
}
