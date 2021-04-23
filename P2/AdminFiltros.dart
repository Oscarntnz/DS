import 'CadenaFiltros.dart';
import 'Post.dart';
import 'Filtro.dart';


class AdminFiltros{
  CadenaFiltros cadenaFiltros;

 void setFiltro(Filtro filtro) {
   this.cadenaFiltros.addFiltro(filtro);
  }

 void setTarget(Post post) {
   this.cadenaFiltros.setTarget(post);
  }
  
  List<Filtro> getFiltros(){
    return cadenaFiltros.getFiltros();
  }

  AdminFiltros(){
   this.cadenaFiltros = new CadenaFiltros(null);
  }

 void ejecutar() {
   this.cadenaFiltros.ejecutar();
  }
}