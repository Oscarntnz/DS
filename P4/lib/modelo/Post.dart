import 'Usuario.dart';

class Post {
    String _texto;
    Usuario _autor;
    List<String> _etiquetas;
    DateTime _fecha;
    List<Usuario> _likes;
    int _id;

    Post(String texto, Usuario autor, {int id = -1}) {
      this._texto = texto;
      this._autor = autor;
      this._etiquetas = [];
      this._fecha = DateTime.now();
      this._likes = [];
      this._id = id;
    }

    void setAutor(Usuario u) {
      this._autor = u;
    }

    void setLikes(List<Usuario> likes) {
      this._likes = likes;
    }

    void setId(int id) {
      this._id = id;
    }

    String getTexto(){
      return _texto;
    }

    int getId() {
      return _id;
    }

    void setTexto(String texto){
      this._texto = texto;
    }

    List<String> getEtiquetas(){
      return _etiquetas;
    }

    Usuario getAutor(){
      return _autor;
    }

    DateTime getFecha(){
      return _fecha;
    }

    bool tieneEtiqueta(String etiqueta){
      var it = this._etiquetas.iterator;

      while(it.moveNext())
        if(it.current.compareTo(etiqueta) == 0)
          return true;

      return false;
    }

    bool tieneTexto(String texto){
      if(this._texto.indexOf(texto) != -1)
        return true;

      return false;
    }

    void setEtiquetas(List<String> etiquetas){
      this._etiquetas.clear();
      var it = etiquetas.iterator;

      while(it.moveNext())
        this._etiquetas.add(it.current);

    }

    int getLikes() {
      return this._likes.length;
    }

    int haDadoLike(Usuario usuario) {
      int indice = -1;

      _likes.asMap().forEach((i, u) {
        if(u == usuario) {
          indice = i;

          return;
        }
      });

      return indice;
    }

    bool toggleLike(Usuario u) {
      var i = haDadoLike(u);

      if(i != -1) {
        _likes.removeAt(i);

        return false;
      }
      else {
        _likes.add(u);

        return true;
      }
  }

    bool operator ==(covariant Post otro){
      return this._id == otro._id;
    }

    Post.fromJson(Map<String, dynamic> json) :
      this._texto = json['texto'],
      this._id = json['id'],
      this._fecha = DateTime.parse(json['fecha']),
      this._etiquetas = [],
      this._likes = [];

    Map<String, dynamic> toJson() => {
      'texto': _texto,
      'usuario_id': _autor.getId()
    };

    void addEtiqueta(String tag) {
      _etiquetas.add(tag);
    }

}
