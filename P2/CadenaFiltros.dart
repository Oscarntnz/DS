import 'package:p2/Filtro.dart';
import 'package:p2/Post.dart';

class CadenaFiltros {

  List<Filtro> filtros;
  Post target;


  CadenaFiltros(Post target){
  this.target = target;
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


