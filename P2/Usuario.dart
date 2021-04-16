class Usuario {
    String nombreUsuario;
    String password;

    String getNombre(){
      return nombreUsuario;
    }

    Usuario(String nombreUsuario, String password){
      this.nombreUsuario = nombreUsuario;
      this.password = password;
    }
}