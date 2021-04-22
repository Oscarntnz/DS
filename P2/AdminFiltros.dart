import 'package:p2/CadenaFiltros.dart';
import 'package:p2/Post.dart';
import 'package:p2/Filtro.dart';


class AdminFiltros{
  CadenaFiltros cadenaFiltros;

 void setFiltro(Filtro filtro) {
  cadenaFiltros.addFiltro(filtro);
  }

 void setTarget(Post post) {
  cadenaFiltros.setTarget(post);
  }

 void ejecutar() {
    cadenaFiltros.ejecutar();
  }
}