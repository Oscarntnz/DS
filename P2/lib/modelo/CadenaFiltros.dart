import 'Filtro.dart';
import 'Post.dart';

class CadenaFiltros {

  List<Filtro> _filtros;
  Post _target;


  CadenaFiltros(Post target){
    this._target = target;
    this._filtros = [];
  }

  addFiltro(Filtro filtro) {
    _filtros.add(filtro);
  }

  setTarget(Post objetivo){
    _target = objetivo;
  }

  ejecutar() {
    for(int i= 0; i < _filtros.length; i++)
      _filtros[i].ejecutar(_target);
  }
}


