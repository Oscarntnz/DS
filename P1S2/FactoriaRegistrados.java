package P1S2;

public class FactoriaRegistrados extends FactoriaUsuariosPost {

    private static FactoriaRegistrados INSTANCE;
    
    private FactoriaRegistrados(){}
    
    static public FactoriaRegistrados getInstance(){
        if(INSTANCE == null)
            INSTANCE = new FactoriaRegistrados();
        
        return INSTANCE;
    }
    /**
     * 
     * @param nombreUsuario
     * @param password
     */
    public Usuario crearUsuario(String nombreUsuario, String password) {
            // TODO - implement FactoriaRegistrados.crearUsuario
            throw new UnsupportedOperationException();
    }

    /**
     * 
     * @param texto
     * @param autor
     */
    public Post crearPost(String texto, Usuario autor) {
            // TODO - implement FactoriaRegistrados.crearPost
            throw new UnsupportedOperationException();
    }

}