class Usuario {
  String nombreUsuario;
  String password;
  List<Usuario> seguidos;
  List<Usuario> seguidores;
  List<String> busquedasRecientes;

  String getNombre(){
    return nombreUsuario;
  }

  String getPassword(){
    return password;
  }

  List<Usuario> getSeguidores(){
    return seguidores;
  }

  List<Usuario> getSeguidos(){
    return seguidos;
  }

  bool isSeguido(Usuario usu){
    if(seguidos.contains(usu))
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

  void seguir(Usuario usu){
    if(!isSeguido(usu))
      seguidos.add(usu);
  }

  void addSeguidor(Usuario u){
    if(!seguidores.contains(u))
      seguidores.add(u);
  }

  Usuario(String nombreUsuario, String password){
    this.nombreUsuario = nombreUsuario;
    this.password = password;
    seguidos = [];
    seguidores = [];
    busquedasRecientes = [];
  }

  List<String> getBusquedasRecientes(){
    return busquedasRecientes;
  }

  void pushBusquedasRecientes(String query){
    busquedasRecientes.add(query);
  }
}