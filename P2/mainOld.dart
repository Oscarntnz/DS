import 'package:flutter/material.dart';
import 'Constructor.dart';
import 'Gestor.dart';
import 'Post.dart';

Gestor g = Constructor().build();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello wolrd',
      home: Publicaciones(),
    );
  }
}

class Publicaciones extends StatefulWidget {
  @override
  _PublicacionesAleatorias createState() => _PublicacionesAleatorias();
}

class _PublicacionesAleatorias extends State<Publicaciones> {
  final _suggestions = g.getAllPublicaciones();
  final _biggerFont = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello wolrd'),
      ),
      body: _getPosts(),
    );
  }

  Widget _getPosts() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _suggestions.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          return _buildRow(_suggestions[i ~/ 2]);
        });
  }

  Widget _buildRow(Post post) {
    return ListTile(
      title: Text(
        post.getAutor().getNombre(),
      ),
      subtitle: Text(post.getTexto(),
      style: _biggerFont,
      ),
    );
  }
}
/*
class PublicacionesAleatorias extends StatefulWidget {
  @override
  _EstadoPublicacionesAleatorias createState() => _EstadoPublicacionesAleatorias();
}

class _EstadoPublicacionesAleatorias extends State<PublicacionesAleatorias> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/