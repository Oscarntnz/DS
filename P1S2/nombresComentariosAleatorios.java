package P1S2;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author oscar
 */

import java.util.Random;
import java.util.ArrayList;

public class nombresComentariosAleatorios {
    static private final String nombres[] = new String[]{"mistyroasted","viewbeach","cartierfalter","becomestatement",
    "scrapeajar","untieand","activistgiddy","libyanporkchop","kidneygull","rivuletmight",
    "discussdiving","publisheranalyst","knownscale","coverallsnetherite","middlepass","hoopoffense",
    "stripedemurrage","dinosaurdolls","currentlycarve","turtleneckobsessed","repeatedlycatfish","dullbreeches",
    "seriouslypassion","kraftbelief","immodestvegetables","exclusivetimberhead","qualifylapis","appointtuxedo",
    "twopleasure","pestowhiting","lustfulproduction","petulantrelative","limitedfact","narrowfascinated","fetchsalami",
    "taiwaneseall","superiorbreak","originalwatercress","pepperkoala","strumardent","worrisomeadditional","areapremium",
    "waverimpolite","herringblackneck","glibhead","swaykhakis","panelmostly","animatedcome","solvekeelhaul","forelimbmacaw"};
    
    static private final String comentarios[] = new String[]{"Lorem ipsum dolor sit amet", "consectetur adipiscing elit. Nunc lacinia quam in blandit malesuada", 
        "Suspendisse odio urna, imperdiet id augue ac, semper pellentesque nisl", "Phasellus sed neque finibus, malesuada tellus sed", 
        "ornare erat. Aenean egestas dui ac est semper tincidunt. Proin at erat eget lacus luctus pretium", "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos", 
        "In at turpis elit", "Donec porta porttitor sapien, nec vestibulum augue egestas vitae. Maecenas et ornare lorem, id lobortis orci", "Nullam commodo risus ac nisi consequat, quis dapibus lectus bibendum", 
        "Nam condimentum risus elit, non faucibus purus dictum eget", "Aliquam mi magna, luctus sit amet dolor in, euismod posuere metus."};
    
    static private ArrayList<String> nombresEnUso = new ArrayList<String>();
    
    static private Random random;
    private static nombresComentariosAleatorios INSTANCE;
    
    private nombresComentariosAleatorios(){
        random = new Random();
    }
    
    private nombresComentariosAleatorios getInstance(){
        if(INSTANCE == null)
            INSTANCE = new nombresComentariosAleatorios();
        
        return INSTANCE;
    }

    static public String getNuevoNombreAleatorio(){
        String nombreADevolver = nombres[random.nextInt(nombres.length)];

        if(nombresEnUso.size() < nombres.length)
            while(nombresEnUso.contains(nombreADevolver))
                nombreADevolver = nombres[random.nextInt(nombres.length)];
        else
            nombreADevolver = "";
        
        return nombreADevolver;
    }
    
    static public String getNombreAleatorio(){
        return nombres[random.nextInt(nombres.length)];
    }
    
    static public String getComentarioAleatorio(){
        return comentarios[random.nextInt(comentarios.length)];
    }
}
