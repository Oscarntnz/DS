<<<<<<< HEAD:P2/CadenaFiltros.dart
import 'Filtro.dart';
import 'Post.dart';

class CadenaFiltros {

  List<Filtro> filtros;
  Post target;


  CadenaFiltros(Post target){
    this.target = target;
    this.filtros = [];
  }

  List<Filtro> getFiltros(){
    return filtros;
  }

  List<Filtro> getFiltros(){
    return filtros;
  }


  addFiltro(Filtro filtro) {
    filtros.add(filtro);
  }

  setTarget(Post objetivo){
    target = objetivo;
  }

  ejecutar() {
    for(int i= 0; i < filtros.length; i++)
      filtros[i].ejecutar(target);
  }
}


=======
import 'Filtro.dart';
import 'Post.dart';

class CadenaFiltros {

  List<Filtro> filtros;
  Post target;


  CadenaFiltros(Post target){
    this.target = target;
    this.filtros = [];
  }

  addFiltro(Filtro filtro) {
    filtros.add(filtro);
  }

  setTarget(Post objetivo){
    target = objetivo;
  }

  ejecutar() {
    for(int i= 0; i < filtros.length; i++)
      filtros[i].ejecutar(target);
  }
}


>>>>>>> 2a8844359ab11eb7283d948f835dd4bfe2725bb3:P2/lib/modelo/CadenaFiltros.dart
