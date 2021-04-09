package P1S2;

import java.util.Scanner;
import java.util.ArrayList;

public class main {

	ArrayList<String> nombresDeUsuario = new ArrayList();
	ArrayList<String> contrasenas = new ArrayList();

	boolean nombreExiste(String username){
		if(nombresDeUsuario.contains(username))
			return true;

		return false;

	}

	boolean comprobacionPasswd(String password){
		if(nombresDeUsuario.contains(username))
			return true;

		return false;

	}
    
    public static void main(String[] args) {

    	int seleccion;
    	boolean running = true;
    	Scanner scan = new Scanner(System.in);
    	FactoriaRegistrados fRegistrados = FactoriaRegistrados.getInstance(); 
    	FactoriaInvitados fInvitados = FactoriaInvitados.getInstance();

        System.out.println("¡Bienvenido a Hello World!");
        System.out.println("Elija una de las siguiente opciones:");

	    selection = scan.nextInt();

	    System.out.println("\n");

	    while (running) {
	                System.out.println( "\n"+"Menú:\n" + "1 - Registro de usuario\n" + 
	                                    "2 - Creación de post\n" + "3 - Borrar un pedido\n" + 
	                                    "0 - Salir");

		    switch (selection) {
		        case 1:
		            System.out.println("Elija un nombre de usuario:");
		            String username = scan.nextString();
		            boolean existe = nombreExiste(username);

		            while(existe){
		            	System.out.println("Ese nombre no está disponible. Introduzca otro:");
		            	username = scan.nextString();
		            	existe = nombreExiste(username);
		            }

		            System.out.println("Elija una contraseña:");
		            String password = scan.nextString();

		            fRegistrados.crearUsuario(username, password);

		            System.out.println("Su usuario se ha creado correctamente con el nombre: " + username);

		        break;

		        case 2:
		        	System.out.println("¿Desea iniciar sesión? (S/N)");
		        	String answer = scan.nextString();

		        	if(answer == "S"){

		        		System.out.println("Introduzca su nombre de usuario:");
		        		String username = scan.nextString();

		        		boolean existe = nombreExiste(username);

			            while(!existe){
			            	System.out.println("Ese nombre no existe. Introduzca otro:");
			            	username = scan.nextString();
			            	existe = nombreExiste(username);
			            }


		        		System.out.println("Introduzca su contraseña:");
		        		String password = scan.nextString();

		        		boolean passwdCorrecta = comprobacionPasswd(password);

		        		while(!passwdCorrecta){
			            	System.out.println("Contraseña incorrecta. Vuelva a intentarlo:");
			            	password = scan.nextString();
			            	passwdCorrecta = comprobacionPasswd(password);
			            }

			            System.out.println("Escriba el post a publicar: ");
		        		String texto = scan.nextString();

		        		fRegistrados.crearPost(texto, username);



		        	}


		        	else if (answer == "N"){

		        		String nombreInvitado = crearNombreInvitado();
		        		fInvitados.crearUsuario(nombreInvitado);

		        		System.out.println("Escriba el post a publicar: ");
		        		String texto = scan.nextString();

		        		fInvitados.crearPost(texto, nombreInvitado);

		        	}

		        	else{
		        		System.out.println("Opción incorrecta");
		        	}

		                  
		        break;

		        case 0:
		            running = false;
		            System.out.println("¡Hasta luego!");
		        break;
		               
		    }
	}
}