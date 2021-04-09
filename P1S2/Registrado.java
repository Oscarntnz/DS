package P1S2;

public class Registrado extends Usuario {

	private String password;

	/**
     * Constructor por defecto
     *
     * @param nombreUsuario 
     */
    public Registrado(String nombreUsuario, password) {
        super(nombreUsuario);
        this.password = password;

    }
        
        public void seguir(Registrado aSeguir) {
		// TODO - implement Usuario.seguir
		throw new UnsupportedOperationException();
	}

}