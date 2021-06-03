import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_2/vista/Login.dart';
import 'controlador/Gestor.dart';

void main() {
  Gestor().inicializar();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello wolrd!',
      home: Login(),
    );
  }
}