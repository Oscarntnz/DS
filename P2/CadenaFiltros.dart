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


