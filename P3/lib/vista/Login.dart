import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Registro.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
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
            buildLogin(),
          ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget buildLogin(){
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
            Text('Iniciar sesión', style: _estiloTitulo),
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
                  if(gestionarLogin(controlUsuario.text, controlPass.text))
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text('Iniciar sesión'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              child: Text('¿No tienes cuenta?', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Registro()));
              }
            ),
          ],
        ),
      ),
    );
  }

  bool gestionarLogin(String nombre, String pass) {
    if (nombre.isEmpty || pass.isEmpty) {
      alerta('Faltan datos');
    }
    else if (!Gestor().login(nombre, pass)){
      alerta('Credenciales incorrectos');
    }
    else
      return true;

    return false;
  }

  void alerta(String texto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(texto),
        );
      },
    );
  }
}