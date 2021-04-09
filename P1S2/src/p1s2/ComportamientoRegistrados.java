package p1s2;

import java.lang.Thread;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ComportamientoRegistrados extends Thread {
    @Override
    public void run(){
        Registrado u;
        Random r = new Random();
        
        synchronized(this){
            u = (Registrado) Gestor.getInstance().crearUsuario(nombresComentariosAleatorios.getNuevoNombreAleatorio(), "123456", Tipo.Registrado);
        }
            
        while(P1S2.isRunning()){
            try {
                Thread.sleep(1000 + r.nextInt(10000));
            } catch (InterruptedException ex) {
                Logger.getLogger(ComportamientoInvitados.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            u.publicaAleatorio();
        }
    }
}
