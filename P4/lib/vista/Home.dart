import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:p_2/modelo/Post.dart';
import 'Busqueda.dart';
import 'Perfil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'InterfazPost.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final _colorBarra = Color(0xFF001BC3);
  final listaPosts = new ValueNotifier<ListView>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Gestor().getUsuarioActivo().getNombre(),
            style: GoogleFonts.getFont('Raleway')),
        backgroundColor: _colorBarra,
        actions:[
          IconButton(icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Busqueda()).then((value) => setState(() {}));
              },
          ),
        ],
      ),
      body: ValueListenableBuilder<ListView>(
        valueListenable: listaPosts,
        builder: (context, value, child) {
          return ListaPosts();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), onPressed: () => publicarPost(),
      ),
    );
  }

  void publicarPost() {
    final controlPost = new TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Publicar post'),
            content: TextFormField(
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
              controller: controlPost,
            ),
            actions: [
              TextButton(onPressed: () {
                Gestor().publicarPost(
                    controlPost.text, Gestor().getUsuarioActivo());

                listaPosts.notifyListeners();
                Navigator.of(context).pop();
                setState(() {});
              },

              child: Text('Publicar')),
            ],
          );
        }
    );
  }
}

class ListaPosts extends StatefulWidget {
  EstadoPosts createState() => EstadoPosts();
}

class EstadoPosts extends State<ListaPosts> {
  ListView posts;

  @override
  Widget build(BuildContext context){
    posts = _getPosts();

    return posts;
  }

  actualizarPosts() {
    setState(() {
      posts = _getPosts();
    });
  }

  Widget _getPosts() {
    final _publicaciones = Gestor().getAllPublicaciones();
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        itemCount: _publicaciones.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          return InterfazPost(post: _publicaciones[i ~/ 2]);
        });
  }

}