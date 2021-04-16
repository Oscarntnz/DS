package p1s2;

import java.util.ArrayList;
import java.util.Random;

public class Gestor {
    private static Gestor INSTANCE;
    private static FactoriaRegistrados factoriaRegistrados;
    private static FactoriaInvitados factoriaInvitados;
    private static ArrayList<Usuario> usuariosRegistrados;
    private static Random random;
    
    private Gestor(){
        factoriaRegistrados = FactoriaRegistrados.getInstance();
        factoriaInvitados = FactoriaInvitados.getInstance();
        usuariosRegistrados = new ArrayList<Usuario>();
        random = new Random();
    }
    
    static public Gestor getInstance(){
        if(INSTANCE == null)
            INSTANCE = new Gestor();
        
        return INSTANCE;
    }
    
    synchronized public Post crearPost(String texto, Usuario autor, Tipo tipoPost){
        Post devolver = null;
        
        if(autor == null){
            autor = getUsuarioAleatorio();
        }
        
        if(autor != null){
            if(tipoPost == Tipo.Registrado)
                devolver = factoriaRegistrados.crearPost((texto == null ? nombresComentariosAleatorios.getComentarioAleatorio() : texto), 
                        autor);
            else if(tipoPost == Tipo.Invitado)
                devolver = factoriaInvitados.crearPost((texto == null ? nombresComentariosAleatorios.getComentarioAleatorio() : texto), 
                        autor);
        }
        
        return devolver;
    }
    
    synchronized public Usuario crearUsuario(String nombre, String password, Tipo tipoUsuario){
        Usuario devolver = null;
        
        if(tipoUsuario == Tipo.Registrado)
            devolver = factoriaRegistrados.crearUsuario((nombre == null ? nombresComentariosAleatorios.getNuevoNombreAleatorio() : nombre), password);
        else if(tipoUsuario == Tipo.Invitado)
            devolver = factoriaInvitados.crearUsuario((nombre == null ? nombresComentariosAleatorios.getNuevoNombreAleatorio() : nombre), "");
        
        if(devolver != null)
            usuariosRegistrados.add(devolver);
        
        return devolver;
    }
    
    public Usuario getUsuarioAleatorio(){
        if(usuariosRegistrados.size() > 1)
            return usuariosRegistrados.get(random.nextInt(usuariosRegistrados.size()));
        else
            return null;
    }
    
    public String getTextoAleatorio(){
        return nombresComentariosAleatorios.getComentarioAleatorio();
    }
    
}