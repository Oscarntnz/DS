package p1s2;
public abstract class FactoriaUsuariosPost {

	/**
	 * 
	 * @param nombreUsuario
	 * @param password
	 */
	public abstract Usuario crearUsuario(String nombreUsuario, String password);

	/**
	 * 
	 * @param texto
	 * @param autor
	 */
	public abstract Post crearPost(String texto, Usuario autor);

}