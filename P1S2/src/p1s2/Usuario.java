package p1s2;

import java.util.ArrayList;

public abstract class Usuario{

    private String nombreUsuario;
    private String password;
	
   /**
     * Constructor por defecto
     * 
     * @param nombreUsuario
     */
    public Usuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;

    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getNombre() {
        return nombreUsuario;
    }
    
    public String getPassword() {
        return password;
    }

    public ArrayList<Usuario> getSeguidores() {
            // TODO - implement Usuario.getSeguidores
            throw new UnsupportedOperationException();
    }

}