package P1;

import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

public class MonitorSeguidoresLetraA implements Observer {

	Usuario usuarioObservado;
	private int numSeguidores;
        private int numSeguidoresLetraA;

	public MonitorSeguidoresLetraA(Usuario usuario){
            this.usuarioObservado = usuario;

            usuario.addMonitor(this);
            this.numSeguidores = usuarioObservado.getSeguidores().size();
	}
        

	@Override
	public void update(Observable usuario, Object arg) {
            this.numSeguidores = usuarioObservado.getSeguidores().size();

            System.out.println(usuarioObservado.getNombre() + ", seguidores : " + numSeguidores);
	}
        
        private int calcularNumSeguidoresLetraA (Usuario usuario){

		ArrayList<Usuario> seguidores = usuario.getSeguidores();
		int numSeguidoresA = 0;

		for(int i=0; i < seguidores.size(); i++){
			if(seguidores.get(i).getNombre().startsWith("A"))
				numSeguidoresA ++;
		}

		return numSeguidoresA;
	}

}