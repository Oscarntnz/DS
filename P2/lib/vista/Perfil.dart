import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'Busqueda.dart';
import 'package:p_2/modelo/Post.dart';
import 'package:p_2/modelo/Usuario.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Perfil extends StatefulWidget {
  final Usuario usuario;

  Perfil({Key key, @required this.usuario}) : super(key: key);

  @override
  _Perfil createState() => _Perfil(usuario: usuario);
}

class _Perfil extends State<Perfil> {
  final usuario;
  final _colorBarra = Color(0xFF001BC3);

  _Perfil({@required this.usuario}): super();

  var seguidores = 0;
  var seguidos = 0;

  void actualizar() {
    setState(() {
      seguidores = this.usuario.getSeguidores().length;
      seguidos = this.usuario.getSeguidos().length;
    });
  }

  @override
  Widget build(BuildContext context) {
    actualizar();
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
        ElevatedButton(onPressed: () {
          Gestor().seguir(usuario);

          actualizar();
        },
        child: Text('seguir'),),
        SizedBox(height: 20.0),
        Expanded(child: _getPosts()),
      ],
    );
  }



  Widget _getPosts() {
    final _suggestions = Gestor().getPublicacionesUsuario(usuario);
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        itemCount: _suggestions.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          return _buildPost(_suggestions[i ~/ 2]);
        });
  }

  Widget _buildPost(Post post) {
    final _estiloTexto = TextStyle(fontSize: 20.0);
    final _estiloAutor =  TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
    final DateFormat formatter = DateFormat("H:m - dd\\MM\\yyyy");

    return ListTile(
      title: InkWell(
        child: Text( post.getAutor().getNombre(),
          style: _estiloAutor,
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil(usuario: post.getAutor()))),
      ),
      subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(post.getTexto(),
                style: _estiloTexto,
              ),
            ),

            Text(formatter.format(post.getFecha())),
          ]
      ),
      isThreeLine: true,
    );
  }
}