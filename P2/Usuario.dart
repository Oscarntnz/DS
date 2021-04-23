class Usuario {
    String nombreUsuario;
    String password;

    String getNombre(){
      return nombreUsuario;
    }

    String getPassword(){
      return password;
    }

    Usuario(String nombreUsuario, String password){
      this.nombreUsuario = nombreUsuario;
      this.password = password;
    }
}