//fichero de prueba: Gestor_test.dart

import 'package:test/test.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:p_2/modelo/Usuario.dart';



void main(){
  group ('Gestor', () {
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