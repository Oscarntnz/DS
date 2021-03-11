/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package P1;

import java.util.ArrayList;
import java.lang.Thread;
import java.util.Random;
import java.util.List;
import java.util.Arrays;
import java.lang.Math;

/**
 *
 * @author oscar
 */


public class P1S1 extends Thread{
    
    static private final String nombres[] = new String[]{"mistyroasted","viewbeach","cartierfalter","becomestatement",
    "scrapeajar","untieand","activistgiddy","libyanporkchop","kidneygull","rivuletmight",
    "discussdiving","publisheranalyst","knownscale","coverallsnetherite","middlepass","hoopoffense",
    "stripedemurrage","dinosaurdolls","currentlycarve","turtleneckobsessed","repeatedlycatfish","dullbreeches",
    "seriouslypassion","kraftbelief","immodestvegetables","exclusivetimberhead","qualifylapis","appointtuxedo",
    "twopleasure","pestowhiting","lustfulproduction","petulantrelative","limitedfact","narrowfascinated","fetchsalami",
    "taiwaneseall","superiorbreak","originalwatercress","pepperkoala","strumardent","worrisomeadditional","areapremium",
    "waverimpolite","herringblackneck","glibhead","swaykhakis","panelmostly","animatedcome","solvekeelhaul","forelimbmacaw"};

    static private ArrayList<String> nombresEnUso;
    static private Random random;
    static private Usuario usuarioMonitorizado;

    //constructor 
    public P1S1 (Usuario us){
        usuarioMonitorizado = us;
    }
    
    
    private static synchronized String getNombreNoUsado(){
        String nombreADevolver = nombres[random.nextInt(nombres.length)];

        if(nombresEnUso.size() < nombres.length)
            while(nombresEnUso.contains(nombreADevolver))
                nombreADevolver = nombres[random.nextInt(nombres.length)];
        else
            nombreADevolver = "";
        
        return nombreADevolver;
    }
    
    
    @Override
    public void run(){
        
        // Monitor
        if(getId() == 0){
            while(true){
                break;
            }
        }
        else{
            while(true){
                try{
                    sleep(random.nextInt(5000));
                    synchronized("Creacion usuario"){
                        String nombre = getNombreNoUsado();

                        if(getNombreNoUsado().isEmpty())
                            break;

                        Usuario usuario = new Usuario(nombre);

                        usuario.seguir(usuarioMonitorizado);
                    }
                } catch (Exception e){
                    System.err.println("La hebra " + getId() + " ha tenido un problema.");
                    System.err.println(e.getMessage());
                }
            }
        }

    }
    
    public static void main(String[] args){
        
        
        nombresEnUso = new ArrayList<>();
        random = new Random();
        String nombre = nombres[random.nextInt(nombres.length)];
        nombresEnUso.add(nombre);
        usuarioMonitorizado = new Usuario(nombre);
        monitorSeguidores grafica = new monitorSeguidores(usuarioMonitorizado);
        monitorSeguidoresLetra graficaPull = new monitorSeguidoresLetra(usuarioMonitorizado);
      
        usuarioMonitorizado.addMonitor(grafica);
        
        P1S1 cliente = new P1S1(usuarioMonitorizado);
      
      
        cliente.start();
        
       
        graficaPull.setVisible(true);
        graficaPull.hebra.start();

        
        grafica.setVisible(true);
    }
}
