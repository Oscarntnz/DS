import '../controlador/Gestor.dart';
import '../modelo/AdminFiltros.dart';
import '../modelo/FiltroEtiquetas.dart';
import '../modelo/FiltroCensura.dart';

class Constructor {
  Constructor._constructorPrivado();

  static final Constructor _instance = Constructor._constructorPrivado();

  factory Constructor() {
    return _instance;
  }

  void build() async {
    AdminFiltros adminFiltros = new AdminFiltros();
    FiltroEtiquetas fEtiq = new FiltroEtiquetas();
    FiltroCensura fCen = new FiltroCensura();

    adminFiltros.setFiltro(fEtiq);
    adminFiltros.setFiltro(fCen);

    Gestor().setAdminFiltros(adminFiltros);

    await Gestor().recargarUsuarios();
    await Gestor().recargarPost();
  }
}