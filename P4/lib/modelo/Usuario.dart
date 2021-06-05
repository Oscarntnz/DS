class Usuario {
  String _nombreUsuario;
  String _password;
  List<Usuario> _seguidos;
  List<Usuario> _seguidores;
  List<String> _busquedasRecientes;
  int _id;

  Usuario(String nombreUsuario, String password, {int id = -1}){
    this._nombreUsuario = nombreUsuario;
    this._password = password;
    this._seguidos = [];
    this._seguidores = [];
    this._busquedasRecientes = [];
    this._id = id;
  }

  int getId() {
    return _id;
  }

  String getNombre() {
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

  void setId(int id) {
    this._id = id;
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

  List<String> getBusquedasRecientes(){
    return _busquedasRecientes;
  }

  void pushBusquedasRecientes(String query){
    _busquedasRecientes.add(query);
  }

  bool operator ==(covariant Usuario otro){
    return this._id == otro._id;
  }

  bool sigueA(Usuario u) {
    return _seguidos.contains(u);
  }

  void dejarDeSeguir(Usuario u) {
    _seguidos.remove(u);
  }

  void removeSeguidor(Usuario u) {
    _seguidores.remove(u);
  }

  Usuario.fromJson(Map<String, dynamic> json) :
    this._nombreUsuario = json['nombre'],
    this._password = json['contraseña'],
    this._seguidos = [],
    this._seguidores = [],
    this._busquedasRecientes = [],
    this._id = json['id'];

  Map<String, dynamic> toJson() => {
    'nombre': _nombreUsuario,
    "contraseña": _password
  };

}