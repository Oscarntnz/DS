package p1s2;

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
    

}