package P1;

import java.util.ArrayList;
import java.lang.Thread;
import java.util.Random;
import java.util.List;
import java.util.Arrays;
import java.lang.Math;

public class procesador extends Thread {

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
    static private boolean inicializado = false;
    static private MonitorSeguidores monitor;

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
        synchronized("inicializacion"){
            if(!inicializado){
                nombresEnUso = new ArrayList<>();
                random = new Random();
                String nombre = nombres[random.nextInt(nombres.length)];
                nombresEnUso.add(nombre);
                usuarioMonitorizado = new Usuario(nombre);
                monitor = new MonitorSeguidores(usuarioMonitorizado);
                
                inicializado = true;
            }
        }
        
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

}
