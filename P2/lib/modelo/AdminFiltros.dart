<<<<<<< HEAD:P2/AdminFiltros.dart
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
=======
import 'CadenaFiltros.dart';
import 'Post.dart';
import 'Filtro.dart';


class AdminFiltros{
  CadenaFiltros cadenaFiltros;

 void setFiltro(Filtro filtro) {
   this.cadenaFiltros.addFiltro(filtro);
  }

  List<Filtro> getFiltros(){
    return cadenaFiltros.getFiltros();
  }


 void setTarget(Post post) {
   this.cadenaFiltros.setTarget(post);
  }

  AdminFiltros(){
   this.cadenaFiltros = new CadenaFiltros(null);
  }

 void ejecutar() {
   this.cadenaFiltros.ejecutar();
  }
>>>>>>> 2a8844359ab11eb7283d948f835dd4bfe2725bb3:P2/lib/modelo/AdminFiltros.dart
}