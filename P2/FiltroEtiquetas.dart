import 'package:p2/Filtro.dart';
import 'package:p2/Post.dart';

class FiltroEtiquetas extends Filtro {
  ejecutar(Post post) {

    String etiqueta;
    List<String> etiquetas;
    String texto = post.getTexto();
    int i = 0;

    while(i < texto.length){
      if(texto[i] == '#'){
        i++;
        while(texto[i] != ' ' && i < texto.length){
          etiqueta += texto[i];
          i++;
        }

        if(!etiqueta.isEmpty){
          etiquetas.add(etiqueta);
          etiquetas.clear();
        }
    }

    else
      i++;
    }

    post.setEtiquetas(etiquetas);

    return texto;
  }
}