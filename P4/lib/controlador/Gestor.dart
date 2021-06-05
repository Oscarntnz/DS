import '../modelo/AdminFiltros.dart';
import '../modelo/Usuario.dart';
import '../modelo/Post.dart';
import 'Constructor.dart';
import 'BD.dart';

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

    void recargarPost() async {
      _publicaciones = [];

      await BD().getAllPosts();
    }

    void recargarUsuarios() async  {
      _usuarios = [];

      await BD().getAllUsuarios();
    }

    List<Usuario> getUsuarios(){
        return _usuarios;
    }

    Usuario getUsuarioById(int id) {
      var it = _usuarios.iterator;

      while(it.moveNext())
        if(it.current.getId() == id)
          return it.current;

      return null;
    }

    getUsuario(String username) {
      var it = _usuarios.iterator;

      while(it.moveNext())
        if(it.current.getNombre() == username)
          return it.current;

      return null;
    }

    Post getPostById(int id) {
      var it = _publicaciones.iterator;

      while(it.moveNext())
        if(it.current.getId() == id)
          return it.current;

      return null;
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

    Future<Usuario> registrar(String nombreUsuario, String password) async {
        if(nombreUsuario.isNotEmpty && nombreUsuario.length > 3
            && password.isNotEmpty && password.length > 3
            && getUsuario(nombreUsuario) == null) {
          Usuario u = new Usuario(nombreUsuario, password);

          if(await BD().subirUsuario(u)){
            _usuarioActivo = _usuarios.last;

            return _usuarioActivo;
          }
          else
            return null;
        }
        else
            return null;
    }

    bool addUsuario(Usuario u) {
      if(u != null) {
        _usuarios.add(u);

        return true;
      }
      else
        return false;
    }

    void setAdminFiltros(AdminFiltros adminFiltros){
        this._adminFiltros = adminFiltros;
    }

    Future<Post> publicarPost(String texto, {Usuario autor}) async {
      if(autor == null)
        autor = _usuarioActivo;

        Post resultado = new Post(texto, autor);

        _adminFiltros.setTarget(resultado);
        _adminFiltros.ejecutar();

        if(await BD().subirPost(resultado)) {
          _publicaciones.add(resultado);

          return _publicaciones.last;
        }
        else
          return null;
  }

    Post addPost(Post p) {
      _publicaciones.add(p);

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

    bool cargarSeguir(Usuario usuario, {Usuario quien}) {
      if(quien == null)
        quien = _usuarioActivo;

      if(!quien.sigueA(usuario)) {
        quien.seguir(usuario);
        usuario.addSeguidor(quien);

        return true;
      }
      else{
        quien.dejarDeSeguir(usuario);
        usuario.removeSeguidor(quien);

        return false;
      }
    }

    Future<bool> toggleSeguir(Usuario usuario, {Usuario quien}) async {
      if(quien == null)
        quien = _usuarioActivo;

      if(usuario != quien) {
        if (!quien.sigueA(usuario)) {
          if (await BD().subirSeguido(quien, usuario)) {
            quien.seguir(usuario);
            usuario.addSeguidor(quien);

            return true;
          }
          else
            return false;
        }
        else {
          if (await BD().quitarSeguido(quien, usuario)) {
            quien.dejarDeSeguir(usuario);
            usuario.removeSeguidor(quien);

            return false;
          }
          else
            return false;
        }
      }

      return false;
  }

    List<Usuario> getSeguidores(){
      return _usuarioActivo.getSeguidores();
    }

    List<Usuario> getSeguidos(){
      return _usuarioActivo.getSeguidos();
    }

    Future<bool> toggleLike(Post post, {Usuario quien}) async {
      if(quien == null)
        quien = _usuarioActivo;

      if(post.haDadoLike(quien) != -1) {
        if(await BD().quitarLike(post, quien))
          return post.toggleLike(quien);
      }
      else {
        if(await BD().darLike(post, quien))
          return post.toggleLike(quien);
      }

      return false;
    }

    bool cambiarLike(Post post, {Usuario quien}) {
      if(quien == null)
        quien = _usuarioActivo;

        return post.toggleLike(quien);
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
