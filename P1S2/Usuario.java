package P1S2;

import java.util.ArrayList;

public abstract class Usuario {

	private String nombreUsuario;

	
	/**
     * Constructor por defecto
     * 
     * @param nombreUsuario
     */
    public Usuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }


	public String getNombre() {
            return nombreUsuario;
	}

	public ArrayList<Usuario> getSeguidores() {
		// TODO - implement Usuario.getSeguidores
		throw new UnsupportedOperationException();
	}

}