import 'package:flutter/cupertino.dart';
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
      title: 'Hello wolrd!',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final _suggestions = g.getAllPublicaciones();
  final _temaTextoBarra = TextTheme(headline6: TextStyle(fontSize: 50.0, fontFamily: 'Roboto'));
  final _colorBarra = Color(0xFF001BC3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello wolrd!'),
        textTheme: _temaTextoBarra,
        backgroundColor: _colorBarra,
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

          return _buildPost(_suggestions[i ~/ 2]);
        });
  }

  Widget _buildPost(Post post) {
    final _estiloTexto = TextStyle(fontSize: 20.0);
    final _estiloAutor =  TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);

    return ListTile(
      title: Text(
        post.getAutor().getNombre(),
        style: _estiloAutor,
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

            Text(post.getAutor().getNombre()),
            ]
        ),
      isThreeLine: true,
    );
  }
}