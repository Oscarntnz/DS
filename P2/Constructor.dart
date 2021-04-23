import 'Gestor.dart';
import 'AdminFiltros.dart';
import 'FiltroEtiquetas.dart';
import 'FiltroCensura.dart';
import 'Post.dart';
import 'Usuario.dart';

class Constructor {
  Constructor._constructorPrivado();

  static final Constructor _instance = Constructor._constructorPrivado();

  factory Constructor() {
    return _instance;
  }

  Gestor build() {
    Gestor gestor = new Gestor();
    AdminFiltros adminFiltros = new AdminFiltros();
    FiltroEtiquetas fEtiq = new FiltroEtiquetas();
    FiltroCensura fCen = new FiltroCensura();

    adminFiltros.setFiltro(fEtiq);
    adminFiltros.setFiltro(fCen);

    gestor.setAdminFiltros(adminFiltros);

    Usuario u1 = gestor.registrar("mistyroasted", "1234");
    Usuario u2 = gestor.registrar("viewbeach", "4321");
    Usuario u3 = gestor.registrar("cartierfalter", "13245");

    gestor.publicarPost("esta es la palla que he hecho hoy #paella", u1);
    gestor.publicarPost(
        "hoy he hecho unas croquetas para comer #croquetas #delicia", u2);
    gestor.publicarPost(
        "hello world yo tambien quiero croquetas #croquetas", u3);

    return gestor;
  }
}