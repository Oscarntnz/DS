//import 'AdminFiltros.dart'
import 'Usuario.dart';
import 'Post.dart';

class Gestor {
    //var adminFiltros;
    List<Usuario> usuarios;
    List<Post> publicaciones;

    List<Usuario> getUsuarios(){
        return usuarios;
    }

    List<Post> getAllPublicaciones(){
        return publicaciones;
    }

    List<Post> getPublicaciones(String etiqueta){
        List<Post> resultado;
        var it = publicaciones.iterator;

        while(it.moveNext())
            if(it.current.tieneEtiqueta(etiqueta))
                resultado.add(it.current);

        return resultado;
    }

    Gestor(){
        usuarios = [];
        publicaciones = [];
    }

    Usuario registrar(String nombreUsuario, String password){
        if(nombreUsuario.isNotEmpty && nombreUsuario.length > 3 && password.isNotEmpty && password.length > 3){
            usuarios.add(new Usuario(nombreUsuario, password));

            return usuarios.last;
        }
        else
            return null;
    }
/*
    void setAdminFiltros(AdminFiltros adminFiltros){
        this.adminFiltros = adminFiltros;
    }*/

    Post publicarPost(String texto, Usuario autor){
        Post resultado = new Post(texto, autor);

        //adminFiltros.setTarget(resultado);
        //adminFiltros.ejecutar();

        publicaciones.add(resultado);

        return publicaciones.last;
    }

}
