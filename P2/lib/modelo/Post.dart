import 'Usuario.dart';

class Post {
    String _texto;
    Usuario _autor;
    List<String> _etiquetas;
    DateTime _fecha;

    String getTexto(){
      return _texto;
    }

    void setTexto(String texto){
      this._texto = texto;
    }

    List<String> getEtiquietas(){
      return _etiquetas;
    }

    Usuario getAutor(){
      return _autor;
    }

    DateTime getFecha(){
      return _fecha;
    }

    Post(String texto, Usuario autor) {
      this._texto = texto;
      this._autor = autor;
      this._etiquetas = [];
      this._fecha = DateTime.now();
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
}
