package p1s2;

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
	public Usuario crearUsuario(String nombreUsuario, String password){
		
		return new Registrado(nombreUsuario,password);

	}

	/**
	 * 
	 * @param texto
	 * @param autor
	 */
	public Post crearPost(String texto, Usuario autor){
	
		return new PostRegistrado(texto, (Registrado) autor);
	}

}