package P1;

import java.util.Observable;
import java.util.Observer;
import java.util.ArrayList;


public class Usuario extends Observable {

	private String nombreUsuario;
    private ArrayList<Usuario> seguidores;
    private ArrayList<Usuario> seguidos;
    
    public Usuario(String nombreUsuario){
        this.nombreUsuario = nombreUsuario;
        seguidores = new ArrayList<>();
        seguidos = new ArrayList<>();
    }

	/**
	 * 
	 * @param aSeguir
	 */
	public void seguir(Usuario aSeguir) {
            if(!seguidos.contains(aSeguir)){
                seguidos.add(aSeguir);
                aSeguir.addSeguidor(this);
            }
	}

    private synchronized void addSeguidor(Usuario seguidor){
        seguidores.add(seguidor);

        setChanged();
        notifyObservers();
    }

    public synchronized void addMonitor(Observer monitor){
        addObserver(monitor);
    }

    public ArrayList<Usuario> getSeguidores(){
        return new ArrayList<Usuario>(seguidores);
    }

    public String getNombre(){
        return nombreUsuario;
    }

}