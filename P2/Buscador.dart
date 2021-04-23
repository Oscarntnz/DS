import 'package:p2/Post.dart';
import 'package:p2/Usuario.dart';

class Buscador{


  //si devuelve la lista de Posts vacía, quiere decir que no ha encontrado ninguno con el hashtag
  List<Post> buscarPost(String hashtag, List<Post> posts){
    String hashtagTexto = "";
    List<Post> resultPosts;

    //obtenemos el hashtag sin el símbolo #
    for(int i = 1; i < hashtag.length; i++){
      hashtagTexto += hashtag[i];

    }

    //recorremos los hashtags de los post y añadimos los que coincidan a una lista
    for(int i = 0; i < posts.length; i++){

      if(posts[i].tieneEtiqueta(hashtagTexto))
        resultPosts.add(posts[i]);
    }

    return resultPosts;
  }

  //si devuelve un usuario null, significa que no lo ha encontrado
  Usuario buscarUsuario(String usu, List<Usuario> usuarios){
    String usuTexto = "";
    Usuario resultUsu = null;

    //obtenemos el nombre del usuario sin el símbolo @
    for(int i = 1; i < usu.length; i++){
      usuTexto += usu[i];
    }

    //recorremos los hashtags de los post y añadimos los que coincidan a una lista
    for(int i = 0; i < usuarios.length; i++){

      if(usuarios[i].getNombre() == usuTexto)
        resultUsu = usuarios[i];
    }

    return resultUsu;
  }

}