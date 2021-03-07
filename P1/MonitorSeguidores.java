package P1;

import java.util.Observable;
import java.util.Observer;

public class MonitorSeguidores implements Observer {

	Usuario usuarioObservado;
	private int numSeguidores;

	public MonitorSeguidores(Usuario usuario){
            this.usuarioObservado = usuario;

            usuario.addMonitor(this);
            this.numSeguidores = usuarioObservado.getSeguidores().size();
	}

	@Override
	public void update(Observable usuario, Object arg) {
            this.numSeguidores = usuarioObservado.getSeguidores().size();

            System.out.println(usuarioObservado.getNombre() + ", seguidores : " + numSeguidores);
	}

}