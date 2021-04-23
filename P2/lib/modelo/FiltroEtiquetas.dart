import 'package:p_2/modelo/Filtro.dart';
import 'Post.dart';

class FiltroEtiquetas extends Filtro {
  ejecutar(Post post) {

    String etiqueta = "";
    List<String> etiquetas = [];
    String texto = post.getTexto();
    int i = 0;

    while(i < texto.length){
      if(texto[i] == '#'){
        i++;
        while(i < texto.length && texto[i] != ' '){
          etiqueta += texto[i];
          i++;
        }

        if(!etiqueta.isEmpty){
          etiquetas.add(etiqueta);
          etiqueta = "";
        }
    }

    else
      i++;
    }

    post.setEtiquetas(etiquetas);

    return texto;
  }
}