import 'package:test/test.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:p_2/modelo/Post.dart';
import 'package:p_2/modelo/Usuario.dart';

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
      expect(p.getEtiquetas(), ['aaa']);
    });

    test('seguidos y seguidores deben de incrementar', () {
      final gestor = Gestor();
      gestor.inicializar();
      gestor.registrar("tWey", "12345");
      Usuario usu = gestor.buscarUsuario("mistyroasted");
      gestor.seguir(usu);

      expect(gestor.getSeguidos().contains(usu), true);
      expect(gestor.getSeguidos().length, 1);

      gestor.logout();
      gestor.login("mistyroasted", "1234");
      Usuario usu1 = gestor.buscarUsuario("tWey");
      expect(gestor.getSeguidores().contains(usu1), true);
      expect(gestor.getSeguidores().length, 2); //ya de por sí, en el constructor se le añade un seguidor

    });

  });
}