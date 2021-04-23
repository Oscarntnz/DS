import 'Usuario.dart';

class Post {
    String texto;
    Usuario autor;
    List<String> etiquetas;

    String getTexto(){
      return texto;
    }

    void setTexto(String texto){
      this.texto = texto;
    }

    List<String> getEtiquetas(){
      return etiquetas;
    }

    Usuario getAutor(){
      return autor;
    }

    Post(String texto, Usuario autor) {
      this.texto = texto;
      this.autor = autor;
      this.etiquetas = [];
    }

    bool tieneEtiqueta(String etiqueta){
      var it = etiquetas.iterator;

      while(it.moveNext())
        if(it.current.compareTo(etiqueta) == 0)
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
