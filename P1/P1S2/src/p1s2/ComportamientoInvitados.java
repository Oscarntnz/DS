/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1s2;

import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author oscar
 */
public class ComportamientoInvitados extends Thread {
    @Override
    public void run(){
        Invitado u;
        Random r = new Random();
        
        synchronized(this){
            u = (Invitado) Gestor.getInstance().crearUsuario(nombresComentariosAleatorios.getNuevoNombreAleatorio(), "", Tipo.Invitado);
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
