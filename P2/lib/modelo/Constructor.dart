import 'package:p_2/controlador/Gestor.dart';
import 'AdminFiltros.dart';
import 'FiltroEtiquetas.dart';
import 'FiltroCensura.dart';
import 'Usuario.dart';

class Constructor {
  Constructor._constructorPrivado();

  static final Constructor _instance = Constructor._constructorPrivado();

  factory Constructor() {
    return _instance;
  }

  void build() {
    AdminFiltros adminFiltros = new AdminFiltros();
    FiltroEtiquetas fEtiq = new FiltroEtiquetas();
    FiltroCensura fCen = new FiltroCensura();

    adminFiltros.setFiltro(fEtiq);
    adminFiltros.setFiltro(fCen);

    Gestor().setAdminFiltros(adminFiltros);

    Usuario u1 = Gestor().registrar("mistyroasted", "1234");
    Usuario u2 = Gestor().registrar("viewbeach", "4321");
    Usuario u3 = Gestor().registrar("cartierfalter", "13245");

    Gestor().login(u1.getNombre(), u1.getPassword());
    Gestor().seguir(u2);
    Gestor().seguir(u3);
    Gestor().login(u2.getNombre(), u2.getPassword());
    Gestor().seguir(u1);

    Gestor().publicarPost("esta es la palla que he hecho hoy #paella", u1);
    Gestor().publicarPost(
        "hoy he hecho unas croquetas para comer #croquetas #delicia", u2);
    Gestor().publicarPost(
        "hello world yo tambien quiero croquetas #croquetas", u3);
  }
}