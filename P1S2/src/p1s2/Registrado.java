package p1s2;

import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Registrado extends Usuario {
    
    String password;
   /**
     * Constructor por defecto
     *
     * @param nombreUsuario 
     * @param password
     */
    public Registrado(String nombreUsuario, String password) {
        super(nombreUsuario);
        this.password = password;
    }
        
    public void seguir(Registrado aSeguir) {
            // TODO - implement Usuario.seguir
            throw new UnsupportedOperationException();
    }
    
    public void publicaAleatorio(){
        synchronized(this){
            Post p = Gestor.getInstance().crearPost(Gestor.getInstance().getTextoAleatorio(), this, Tipo.Registrado);

            System.out.println(p.getTexto());
            System.out.println("\t-" + getNombre());
        }
    }
}