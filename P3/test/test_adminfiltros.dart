//fichero de prueba: test_adminfiltros.dart

import 'package:test/test.dart';
import 'package:p_2/modelo/AdminFiltros.dart';
import 'package:p_2/modelo/FiltroEtiquetas.dart';
import 'package:p_2/modelo/FiltroCensura.dart';
import 'package:p_2/modelo/Post.dart';
import 'package:p_2/modelo/Usuario.dart';


void main(){

  group ('AdminFiltros', (){

    final adminFiltros = new AdminFiltros();

    FiltroEtiquetas fEtiq = new FiltroEtiquetas();
    FiltroCensura fCen = new FiltroCensura();

    adminFiltros.setFiltro(fEtiq);
    adminFiltros.setFiltro(fCen);

    test('el número de filtros debe incrementar', () {


      expect(adminFiltros.getFiltros().contains(fEtiq), true);
      expect(adminFiltros.getFiltros().contains(fCen), true);
      expect(adminFiltros.getFiltros().length, 2);

    });

    test('los filtros se deben de ejecutar', () {

      Usuario usu = Usuario("utit", "1234");
      Post post = Post("#hola hello que tal", usu );
      adminFiltros.setTarget(post);

      adminFiltros.ejecutar();

      expect(post.getTexto(), "#hola ***** que tal");
      expect(post.getEtiquetas().length, 1);

    });

  }

  );
}