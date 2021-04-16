package p1s2;

public class FactoriaInvitados extends FactoriaUsuariosPost {
    
    private static FactoriaInvitados INSTANCE;
    
    private FactoriaInvitados(){}
    
    static public FactoriaInvitados getInstance(){
        if(INSTANCE == null)
            INSTANCE = new FactoriaInvitados();
        
        return INSTANCE;
    }

    /**
     * 
     * @param nombreUsuario
     * @param password
     */
    public Usuario crearUsuario(String nombreUsuario, String password) {
            return new Invitado(nombreUsuario);
    }

    /**
     * 
     * @param texto
     * @param autor
     */
    public Post crearPost(String texto, Usuario autor) {
            return new PostInvitado(texto, (Invitado)autor);
    }

}