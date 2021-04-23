import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constructor.dart';
import 'Gestor.dart';
import 'Post.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Login.dart';
import 'Home.dart';

Gestor g = Constructor().build();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello wolrd!',
      home: Registro(),
    );
  }
}

class Registro extends StatefulWidget {
  @override
  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
  final _coloresFondo = [Color(0xFF047DD9), Color(0xFF001BC3)];
  final _estiloTitulo = GoogleFonts.raleway(fontSize: 50.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _coloresFondo,
              ),
            ),
          ),
          buildRegistro(),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget buildRegistro(){
    final controlUsuario = new TextEditingController();
    final controlPass = new TextEditingController();

    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 50.0,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Registro', style: _estiloTitulo),
            SizedBox(height: 10.0),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                hintText: 'Nombre de usuario',
                labelText: 'Nombre de usuario',
                hintStyle: TextStyle(color: Colors.white60),
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: controlUsuario,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                hintStyle: TextStyle(color: Colors.white60),
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: controlPass,
            ),
            SizedBox(height: 300.0),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  if(registrar(controlUsuario.text, controlPass.text))
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text('Registrarsen'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              child: Text('¿Ya tienes cuenta?', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login()));
              }
            ),
          ],
        ),
      ),
    );
  }

  bool registrar(String nombre, String pass) {
    if (nombre.isEmpty || pass.isEmpty) {
      alerta('Faltan datos');
    }
    else if (g.registrar(nombre, pass) == null){
      alerta('El nombre de usuario y la contraseña debe de ser de al menos 3 caracteres');
    }
    else
      return true;

    return false;
  }

  Widget alerta(String texto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the that user has entered by using the
          // TextEditingController.
          content: Text(texto),
        );
      },
    );
  }
}