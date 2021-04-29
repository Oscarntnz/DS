class Usuario {
  String _nombreUsuario;
  String _password;
  List<Usuario> _seguidos;
  List<Usuario> _seguidores;
  List<String> _busquedasRecientes;

  String getNombre(){
    return _nombreUsuario;
  }

  String getPassword(){
    return _password;
  }

  List<Usuario> getSeguidores(){
    return _seguidores;
  }

  List<Usuario> getSeguidos(){
    return _seguidos;
  }

  bool isSeguido(Usuario usu){
    if(this._seguidos.contains(usu))
      return true;

    else
      return false;
  }

  bool isSeguidor(Usuario usu){
    if(usu.isSeguido(this))
      return true;

    else
      return false;
  }

  void seguir(Usuario u){
    if(!isSeguido(u) && u != this)
      _seguidos.add(u);
  }

  void addSeguidor(Usuario u){
    if(!_seguidores.contains(u) && u != this)
      _seguidores.add(u);
  }

  Usuario(String nombreUsuario, String password){
    this._nombreUsuario = nombreUsuario;
    this._password = password;
    _seguidos = [];
    _seguidores = [];
    _busquedasRecientes = [];
  }

  List<String> getBusquedasRecientes(){
    return _busquedasRecientes;
  }

  void pushBusquedasRecientes(String query){
    _busquedasRecientes.add(query);
  }
}