import 'Usuario.dart';

class Post {
    String texto;
    Usuario autor;
    List<String> etiquetas;
    DateTime fecha;

    String getTexto(){
      return texto;
    }

    void setTexto(String texto){
      this.texto = texto;
    }

    List<String> getEtiquietas(){
      return etiquetas;
    }

    Usuario getAutor(){
      return autor;
    }

    DateTime getFecha(){
      return fecha;
    }

    Post(String texto, Usuario autor) {
      this.texto = texto;
      this.autor = autor;
      this.etiquetas = [];
      this.fecha = DateTime.now();
    }

    bool tieneEtiqueta(String etiqueta){
      var it = etiquetas.iterator;

      while(it.moveNext())
        if(it.current.compareTo(etiqueta) == 0)
          return true;

      return false;
    }

    bool tieneTexto(String texto){
      if(this.texto.indexOf(texto) != -1)
        return true;

      return false;
    }

    void setEtiquetas(List<String> etiquetas){
      this.etiquetas.clear();
      var it = etiquetas.iterator;

      while(it.moveNext())
        this.etiquetas.add(it.current);

    }
}
