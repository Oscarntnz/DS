import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import '../lib/main.dart' as app;

//flutter drive --driver=test/driver_integracion.dart --target=test/test_integracion.dart

void main() {
  group("Test integración", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Busqueda correcta', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Iniciar sesion

      final cajaUsuario = find.byType(TextFormField).first;
      final cajaPass = find.byType(TextFormField).last;
      final boton = find.byType(ElevatedButton).first;

      await tester.enterText(cajaUsuario, "mistyroasted");
      await tester.pumpAndSettle();

      await tester.enterText(cajaPass, "1234");
      await tester.pumpAndSettle();

      await tester.tap(boton);
      await tester.pumpAndSettle();

      // publicar post

      final botonPost = find.byIcon(Icons.add);

      await tester.tap(botonPost);
      await tester.pumpAndSettle();

      final publicador = find.byType(AlertDialog).first;

      await tester.enterText(find.descendant(of: publicador, matching: find.byType(TextFormField)), "Post de prueba");
      await tester.pumpAndSettle();
      await tester.tap(find.descendant(of: publicador, matching: find.byType(TextButton)));
      await tester.pumpAndSettle();

      // comprobar que se ha publicado

      expect(find.text("Post de prueba"), findsWidgets);
    });
  });
}