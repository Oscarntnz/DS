import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controlador/Gestor.dart';
import '../vista/InterfazPost.dart';
import 'Busqueda.dart';
import '../modelo/Usuario.dart';
import 'package:google_fonts/google_fonts.dart';

class Perfil extends StatefulWidget {
  final Usuario usuario;

  Perfil({Key key, @required this.usuario}) : super(key: key);

  @override
  _Perfil createState() => _Perfil(usuario: usuario);
}

class _Perfil extends State<Perfil> {
  final usuario;
  final _colorBarra = Color(0xFF001BC3);
  String _seguirDejarDe;

  _Perfil({@required this.usuario}): super();

  var seguidores = 0;
  var seguidos = 0;

  void actualizar(bool seguir) {
    setState(() {
      if(seguir)
        _seguirDejarDe = 'Dejar de seguir';
      else
        _seguirDejarDe = 'Seguir';

      seguidores = this.usuario.getSeguidores().length;
      seguidos = this.usuario.getSeguidos().length;
    });
  }

  @override
  Widget build(BuildContext context) {
    actualizar(Gestor().sigueA(this.usuario));
    return Scaffold(
      appBar: AppBar(
        title: Text(Gestor().getUsuarioActivo().getNombre(),
            style: GoogleFonts.getFont('Raleway')),
        backgroundColor: _colorBarra,
        leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
        actions:[
          IconButton(icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Busqueda());
            },
          ),
        ],
      ),
      body: buildPerfil(),
    );
  }

  Widget buildPerfil() {
    return Column(
      children: [
        Title(child: Text(this.usuario.getNombre(), style: GoogleFonts.raleway(fontSize: 50.0, color: Colors.black),), color: Colors.black,),
        SizedBox(height: 20.0),
        Row(
          children: [
            Listener(child: Text('Seguidores: ' + seguidores.toString())),
            Listener(child: Text('Seguidos: ' + seguidos.toString())),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        SizedBox(height: 20.0),
        ElevatedButton(onPressed: () async => actualizar(await Gestor().toggleSeguir(this.usuario)),
          child: Text(_seguirDejarDe),
        ),
        SizedBox(height: 20.0),
        Expanded(child: _getPosts()),
      ],
    );
  }



  Widget _getPosts() {
    final _suggestions = Gestor().getPublicacionesUsuario(this.usuario);
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        itemCount: _suggestions.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          return InterfazPost(post: _suggestions[i ~/ 2]);
        });
  }
}