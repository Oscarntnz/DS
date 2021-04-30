// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:p_2/vista/Home.dart';
import 'package:p_2/vista/Perfil.dart';

void main() {

  Gestor().inicializar();
  Gestor().login('mistyroasted', '1234');

  Widget home = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: new Home())
  );


  testWidgets('Visualización de posts', (WidgetTester tester) async {

    await tester.pumpWidget(home);

    var listPosts = find.byType(ListView);
    expect(listPosts, findsOneWidget);

  });

  testWidgets('botón publicar post', (WidgetTester tester) async {

    await tester.pumpWidget(home);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
  });

  testWidgets('Busqueda correcta', (WidgetTester tester) async {

    await tester.pumpWidget(home);

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'a');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.text("esta es la palla que he hecho hoy #paella"), findsOneWidget);
  });

}
