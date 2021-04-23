import 'package:test/test.dart';
import 'package:p_2/modelo/Post.dart';

void main() {
  //tieneEtiqueta
  //setEtiquetas

  group('operaciones', () {
    test('setEtiquetas lo añade correctamente', () {
      Post post = new Post('cualquierpost', null);
      post.setEtiquetas(["etiqueta1", "etiqueta2", "etiqueta3"]);
      
      expect(post.etiquetas.length, 3);
      expect(post.etiquetas[0], "etiqueta1");
      expect(post.etiquetas[1], "etiqueta2");
      expect(post.etiquetas[2], "etiqueta3");
    });
    test('tieneEtiqueta detecta correctamente las etiquetas', () {
      Post post = new Post('cualquierpost', null);

      expect(post.tieneTexto("cu"), true);
      expect(post.tieneTexto("cua"), true);
      expect(post.tieneTexto("cualquierpost"), true);
      expect(post.tieneTexto("aaaaa"), false);
    });
  });
}