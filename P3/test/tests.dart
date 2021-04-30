import 'package:test/test.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:p_2/modelo/Post.dart';
import 'package:p_2/modelo/Usuario.dart';
import 'package:p_2/modelo/AdminFiltros.dart';
import 'package:p_2/modelo/FiltroEtiquetas.dart';
import 'package:p_2/modelo/FiltroCensura.dart';

void main() {
  //Publicar post

  group('operaciones', ()
  {
    // Gestor

    test('Publicar post lo añade correctamente', () {
      Gestor().inicializar();
      Gestor().login('mistyroasted', '1234');
      Gestor().publicarPost(
          'post de prueba aaaaaa #aaa', Gestor().getUsuarioActivo());
      Post p = Gestor()
          .getAllPublicaciones()
          .last;

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
      expect(gestor
          .getSeguidos()
          .length, 1);

      gestor.logout();
      gestor.login("mistyroasted", "1234");
      Usuario usu1 = gestor.buscarUsuario("tWey");
      expect(gestor.getSeguidores().contains(usu1), true);
      expect(gestor
          .getSeguidores()
          .length, 2); //ya de por sí, en el constructor se le añade un seguidor

    });

    // Posts

    test('setEtiquetas lo añade correctamente', () {
      Post post = new Post('cualquierpost', null);
      post.setEtiquetas(["etiqueta1", "etiqueta2", "etiqueta3"]);

      expect(post
          .getEtiquetas()
          .length, 3);
      expect(post.getEtiquetas()[0], "etiqueta1");
      expect(post.getEtiquetas()[1], "etiqueta2");
      expect(post.getEtiquetas()[2], "etiqueta3");
    });

    test('tieneTexto detecta correctamente las partes del texto', () {
      Post post = new Post('cualquierpost', null);

      expect(post.tieneTexto("cu"), true);
      expect(post.tieneTexto("cua"), true);
      expect(post.tieneTexto("cualquierpost"), true);
      expect(post.tieneTexto("aaaaa"), false);
    });

    // Admin filtros

    test('el número de filtros debe incrementar', () {
      final adminFiltros = new AdminFiltros();

      FiltroEtiquetas fEtiq = new FiltroEtiquetas();
      FiltroCensura fCen = new FiltroCensura();

      adminFiltros.setFiltro(fEtiq);
      adminFiltros.setFiltro(fCen);

      expect(adminFiltros.getFiltros().contains(fEtiq), true);
      expect(adminFiltros.getFiltros().contains(fCen), true);
      expect(adminFiltros.getFiltros().length, 2);
    });

    test('los filtros se deben de ejecutar', () {
      final adminFiltros = new AdminFiltros();

      FiltroEtiquetas fEtiq = new FiltroEtiquetas();
      FiltroCensura fCen = new FiltroCensura();

      adminFiltros.setFiltro(fEtiq);
      adminFiltros.setFiltro(fCen);

      Usuario usu = Usuario("utit", "1234");
      Post post = Post("#hola hello que tal", usu);

      adminFiltros.setTarget(post);
      adminFiltros.ejecutar();

      expect(post.getTexto(), "#hola ***** que tal");
      expect(post.getEtiquetas().length, 1);
    });
  });
}