import 'package:p_2/modelo/AdminFiltros.dart';
import 'package:p_2/modelo/Usuario.dart';
import 'package:p_2/modelo/Post.dart';
import 'package:p_2/modelo/Constructor.dart';

class Gestor {
    AdminFiltros adminFiltros;
    List<Usuario> usuarios;
    List<Post> publicaciones;
    Usuario usuarioActivo;

    Gestor._constructorPrivado() {
        usuarios = [];
        publicaciones = [];
        usuarioActivo = null;
  }

  static final Gestor _instance = Gestor._constructorPrivado();

    factory Gestor() {
        return _instance;
    }

    void inicializar() {
      Constructor().build();
    }

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

    List<Post> getPublicacionesUsuario(Usuario autor){
      List<Post> resultado = [];
      var it = publicaciones.iterator;

      while(it.moveNext())
        if(it.current.getAutor() == autor)
          resultado.add(it.current);

      return resultado;
    }

    List<Post> buscar(String query){
      List<Post> resultado = [];

      if(query != null)
        if(query[0] == '@')
          resultado = getPublicacionesUsuario(buscarUsuario(query.substring(1, query.length)));
        else
          resultado = getPublicaciones(query);

      return resultado;
    }

    Usuario buscarUsuario(String nombreUsuario) {
      if(nombreUsuario.isNotEmpty){
        Iterator it = usuarios.iterator;

        while(it.moveNext()){
          if(it.current.getNombre() == nombreUsuario) {
            return it.current;
          }
        }
      }

      return null;
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

    void logout(){
      usuarioActivo = null;
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

    Usuario getUsuarioActivo(){
      return usuarioActivo;
    }

    List<String> getBusquedasRecientes(){
      return usuarioActivo.getBusquedasRecientes();
    }

    void pushBusquedasRecientes(String query){
      usuarioActivo.pushBusquedasRecientes(query);
    }

    void seguir(Usuario usuario){
      usuarioActivo.seguir(usuario);
      usuario.addSeguidor(usuarioActivo);
    }

    List<Usuario> getSeguidores(){
      usuarioActivo.getSeguidores();
    }

}
