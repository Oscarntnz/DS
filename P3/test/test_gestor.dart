import 'package:test/test.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:p_2/modelo/Post.dart';

void main() {
  //Publicar post

  group('operaciones', () {
    test('Publicar post lo añade correctamente', () {
      Gestor().inicializar();
      Gestor().login('mistyroasted', '1234');
      Gestor().publicarPost('post de prueba aaaaaa #aaa', Gestor().getUsuarioActivo());
      Post p = Gestor().getAllPublicaciones().last;

      expect(p.getAutor().getNombre(), 'mistyroasted');
      expect(p.getAutor(), Gestor().getUsuarioActivo());
      expect(p.getEtiquietas(), ['aaa']);
    });
    /**
     * otro test
     */
  });
}