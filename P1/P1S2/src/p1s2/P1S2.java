/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1s2;

import java.util.Scanner;
import java.util.ArrayList;
import java.lang.reflect.Array;

public class P1S2 {
    
    static boolean running = true;
    
    static boolean isRunning(){
        return running;
    }
    
    static void terminar(){
        running = false;
    }

    private ArrayList<String> usuariosNombre = new ArrayList();
    private ArrayList<Usuario> usuarios = new ArrayList();
    
     String crearNombreInvitado() {
        
        nombresComentariosAleatorios nuevoNombre = null;
        return nuevoNombre.getNuevoNombreAleatorio();
    }
     
    void addNombre (String nombre) {
        
        usuariosNombre.add(nombre);
    }
    
    void addUsuario (Usuario u) {
        
        usuarios.add(u);
    }

	

    boolean nombreExiste(String username){
        if(usuariosNombre.contains(username))
                return true;

        return false;

    }
    
    Usuario getUsuario (String username){
        
        Usuario u = null;
        for(int i = 0; i < usuarios.size(); i++){
            
            
            
               if((usuarios.get(i)).getNombre().equals(username)){
                   return usuarios.get(i);
               }
        }
        
        return u;
    }

    boolean comprobacionPasswd(String username, String password){
        
        
        Usuario u = getUsuario(username);
        
        return u.getPassword().equals(password);
        
        
    }
    
    public static void main(String[] args) {
    	int selection;
        P1S2 P = new P1S2();
    	Scanner scan = new Scanner(System.in);
    	FactoriaRegistrados fRegistrados = FactoriaRegistrados.getInstance(); 
    	FactoriaInvitados fInvitados = FactoriaInvitados.getInstance();
        ComportamientoRegistrados comReg = new ComportamientoRegistrados();
        ComportamientoInvitados comInv = new ComportamientoInvitados();
        Thread r1 = new Thread(comReg), 
                r2 = new Thread(comReg), 
                r3 = new Thread(comReg), 
                i1 = new Thread(comInv), 
                i2 = new Thread(comInv);

        
        System.out.println("??Bienvenido a Hello World!");
        
        r1.start();
        r2.start();
        r3.start();
        i1.start();
        i2.start();
        
	while (running) {

            System.out.println("\n");
            System.out.println( "\n"+"Men??:\n" + "1 - Registro de usuario\n" + 
                                "2 - Creaci??n de post\n" + "0 - Salir\n");
            System.out.println("Elija una de las opciones:");
            selection = scan.nextInt();
            
            switch (selection) {
                case 1:
                    System.out.println("Elija un nombre de usuario:");
                    String username = scan.next();
                    boolean existe = P.nombreExiste(username);

                    while(existe){
                        System.out.println("Ese nombre no est?? disponible. Introduzca otro:");
                        username = scan.next();
                        existe = P.nombreExiste(username);
                    }

                    System.out.println("Elija una contrase??a:");
                    String password = scan.next();
                    
                    Usuario user = fRegistrados.crearUsuario(username, password);
                    
                    user.setPassword(password);
                    
                    P.addNombre(username);
                    P.addUsuario(user);

                    System.out.println("Su usuario se ha creado correctamente con el nombre: " + username);

                break;

                case 2:
                        System.out.println("??Desea iniciar sesi??n? (0 -> Si /1 -> No)");
                        int answer;
                        answer = scan.nextInt();

                        if(answer == 0){

                                System.out.println("Introduzca su nombre de usuario:");
                                String nombre = scan.next();

                                boolean exist = P.nombreExiste(nombre);

                            while(!exist){
                                System.out.println("Ese nombre no existe. Introduzca otro:");
                                nombre = scan.next();
                                exist = P.nombreExiste(nombre);
                            }


                                System.out.println("Introduzca su contrase??a:");
                                String pass = scan.next();

                                boolean passwdCorrecta = P.comprobacionPasswd(nombre, pass);

                                while(!passwdCorrecta){
                                System.out.println("Contrase??a incorrecta. Vuelva a intentarlo:");
                                pass = scan.next();
                                passwdCorrecta = P.comprobacionPasswd(nombre, pass);
                            }

                            System.out.println("Escriba el post a publicar: ");
                            String texto = scan.next();
                            
                            Usuario usu = P.getUsuario(nombre);
                            fRegistrados.crearPost(texto, usu);



                         }

                       
                        else if (answer == 1){

                                String nombreInvitado = P.crearNombreInvitado();
                                Usuario invi = fInvitados.crearUsuario(nombreInvitado, "");
                                
                                System.out.println("Escriba el post a publicar: ");
                                String texto = scan.next();

                                fInvitados.crearPost(texto, invi);

                        }
                        
                        else{
                                System.out.println("Opci??n incorrecta");
                        }
                        

                break;
                
                case 0:
                    terminar();
                    System.out.println("??Hasta luego!");
                break;

                default:
                    System.out.println("Opci??n no v??lida");
                break;
            }
	}
    }
    
}
