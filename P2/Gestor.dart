import 'package:flutter/cupertino.dart';

import 'AdminFiltros.dart';
import 'Usuario.dart';
import 'Post.dart';

class Gestor {
    AdminFiltros adminFiltros;
    List<Usuario> usuarios;
    List<Post> publicaciones;
    Usuario usuarioActivo;

    List<Usuario> getUsuarios(){
        return usuarios;
    }

    List<Post> getAllPublicaciones(){
        return publicaciones;
    }

    List<Post> getPublicaciones(String etiqueta){
        List<Post> resultado = [];
        var it = publicaciones.iterator;

        while(it.moveNext())
            if(it.current.tieneEtiqueta(etiqueta))
                resultado.add(it.current);

        return resultado;
    }

    Gestor(){
        usuarios = [];
        publicaciones = [];
        usuarioActivo = null;
    }

    Usuario existeUsuario(String nombreUsuario, String password) {
        if(nombreUsuario.isNotEmpty && password.isNotEmpty){
            Iterator it = usuarios.iterator;

            while(it.moveNext()){
                if(it.current.getNombre() == nombreUsuario && it.current.getPassword() == password) {
                    return it.current;
                }
            }
        }

        return null;
    }

    bool login(String nombreUsuario, String password){
        bool correcto = false;
        usuarioActivo = existeUsuario(nombreUsuario, password);

        if(usuarioActivo != null)
            correcto = true;

        return correcto;
    }

    Usuario registrar(String nombreUsuario, String password){
        if(nombreUsuario.isNotEmpty && nombreUsuario.length > 3 && password.isNotEmpty && password.length > 3){
            usuarios.add(new Usuario(nombreUsuario, password));
            usuarioActivo = usuarios.last;

            return usuarioActivo;
        }
        else
            return null;
    }

    void setAdminFiltros(AdminFiltros adminFiltros){
        this.adminFiltros = adminFiltros;
    }

    Post publicarPost(String texto, Usuario autor){
        Post resultado = new Post(texto, autor);

        adminFiltros.setTarget(resultado);
        adminFiltros.ejecutar();

        publicaciones.add(resultado);

        return publicaciones.last;
    }

    List<Usuario> getSeguidores(){
      return usuarioActivo.getSeguidores();
    }

    List<Usuario> getSeguidos(){
      return usuarioActivo.getSeguidos();
    }

}
