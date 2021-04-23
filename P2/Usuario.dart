class Usuario {
  String nombreUsuario;
  String password;
  List<Usuario> seguidos;

  String getNombre(){
    return nombreUsuario;
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

  Usuario(String nombreUsuario, String password){
    this.nombreUsuario = nombreUsuario;
    this.password = password;
  }
}