
import 'package:p2/Filtro.dart';
import 'package:p2/Post.dart';

class FiltroCensura extends Filtro {

  static const int N_PAL_PROH = 3;
  List<String> PALABRAS_PROHIBIDAS = ["hello", "world", "filtro"];

  void reemplazar(String texto, int indice, String palabra){
    String newPalabra = "";
    for(int i = 0; i < palabra.length; i++){
      newPalabra += '*';
    }
    String newTexto = texto.substring(indice)+newPalabra+texto.substring(indice+1);

    texto = newTexto;
  }


  ejecutar(Post post) {
    int indice = -1;
    String resultado = post.getTexto();

    for(int i = 0; i < N_PAL_PROH; i++){ // cambio de palabra
      do{ // mientras exista esa palabra prohibida, sigue buscando
      indice = resultado.indexOf(PALABRAS_PROHIBIDAS[i]);

      if(indice != -1){
        reemplazar(resultado, indice, PALABRAS_PROHIBIDAS[i]);
      }

      }while(indice != -1);
    }

    post.setTexto(resultado);

    return resultado;
  }


}