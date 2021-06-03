import 'package:p_2/modelo/AdminFiltros.dart';
import 'package:p_2/modelo/Usuario.dart';
import 'package:p_2/modelo/Post.dart';
import 'package:p_2/modelo/Constructor.dart';

class Gestor {
    AdminFiltros _adminFiltros;
    List<Usuario> _usuarios;
    List<Post> _publicaciones;
    Usuario _usuarioActivo;

    Gestor._constructorPrivado() {
      _usuarios = [];
      _publicaciones = [];
      _usuarioActivo = null;
  }

  static final Gestor _instance = Gestor._constructorPrivado();

    factory Gestor() {
        return _instance;
    }

    void inicializar() {
      Constructor().build();
    }

    List<Usuario> getUsuarios(){
        return _usuarios;
    }

    List<Post> getAllPublicaciones(){
        return _publicaciones;
    }

    List<Post> getPublicaciones(String texto){
      List<Post> resultado = [];

      var it = _publicaciones.iterator;

      while(it.moveNext())
        if(it.current.tieneTexto(texto))
          resultado.add(it.current);

      return resultado;
    }

    List<Post> getPublicacionesEtiqueta(String etiqueta){
        List<Post> resultado = [];
        var it = _publicaciones.iterator;

        while(it.moveNext())
            if(it.current.tieneEtiqueta(etiqueta))
                resultado.add(it.current);

        return resultado;
    }

    List<Post> getPublicacionesUsuario(Usuario autor){
      List<Post> resultado = [];
      var it = _publicaciones.iterator;

      while(it.moveNext())
        if(it.current.getAutor() == autor)
          resultado.add(it.current);

      return resultado;
    }

    List<Post> buscar(String query){
      List<Post> resultado = [];

      if(query != null && query.isNotEmpty)
        if(query[0] == '@')
          resultado = getPublicacionesUsuario(buscarUsuario(query.substring(1, query.length)));
        else if(query[0] == '#')
          resultado = getPublicacionesEtiqueta(query.substring(1, query.length));
        else
          resultado = getPublicaciones(query);

      return resultado;
    }

    Usuario buscarUsuario(String nombreUsuario) {
      if(nombreUsuario.isNotEmpty){
        Iterator it = _usuarios.iterator;

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
            Iterator it = _usuarios.iterator;

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
        _usuarioActivo = existeUsuario(nombreUsuario, password);

        if(_usuarioActivo != null)
            correcto = true;

        return correcto;
    }

    void logout(){
      _usuarioActivo = null;
    }

    Usuario registrar(String nombreUsuario, String password){
        if(nombreUsuario.isNotEmpty && nombreUsuario.length > 3 && password.isNotEmpty && password.length > 3){
          _usuarios.add(new Usuario(nombreUsuario, password));
          _usuarioActivo = _usuarios.last;

            return _usuarioActivo;
        }
        else
            return null;
    }

    void setAdminFiltros(AdminFiltros adminFiltros){
        this._adminFiltros = adminFiltros;
    }

    Post publicarPost(String texto, Usuario autor){
        Post resultado = new Post(texto, autor);

        _adminFiltros.setTarget(resultado);
        _adminFiltros.ejecutar();

        _publicaciones.add(resultado);

        return _publicaciones.last;
    }

    Usuario getUsuarioActivo(){
      return _usuarioActivo;
    }

    List<String> getBusquedasRecientes(){
      return _usuarioActivo.getBusquedasRecientes();
    }

    void pushBusquedasRecientes(String query){
      _usuarioActivo.pushBusquedasRecientes(query);
    }

    bool toggleSeguir(Usuario usuario){
      if(!_usuarioActivo.sigueA(usuario)) {
        _usuarioActivo.seguir(usuario);
        usuario.addSeguidor(_usuarioActivo);

        return true;
      }
      else{
        _usuarioActivo.dejarDeSeguir(usuario);
        usuario.removeSeguidor(_usuarioActivo);

        return false;
      }
  }

    List<Usuario> getSeguidores(){
      return _usuarioActivo.getSeguidores();
    }

    List<Usuario> getSeguidos(){
      return _usuarioActivo.getSeguidos();
    }

    bool toggleLike(Post post) {
      return post.toggleLike(_usuarioActivo);
    }

    int getLikes(Post post) {
      return post.getLikes();
    }

    bool haDadoLike(Post post) {
      return post.haDadoLike(_usuarioActivo) != -1;
    }

    bool sigueA(Usuario u) {
      return _usuarioActivo.sigueA(u);
    }

}
