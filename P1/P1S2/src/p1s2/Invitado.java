package p1s2;

import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Invitado extends Usuario {
    
    /**
     * Constructor por defecto
     *
     * @param nombreUsuario 
     */
    public Invitado(String nombreUsuario) {
        super(nombreUsuario);
        
    }
    
    public void publicaAleatorio(){
        synchronized(this){
            Post p = Gestor.getInstance().crearPost(Gestor.getInstance().getTextoAleatorio(), this, Tipo.Invitado);

            System.out.println(p.getTexto());
            System.out.println("\t-" + getNombre());
        }
    }
}