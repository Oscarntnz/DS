import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:p_2/modelo/Post.dart';

class Busqueda extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(icon: Icon(Icons.close),
          onPressed: (){
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        }
      );
  }

  String selectedResult;

  @override
  Widget buildResults(BuildContext context){
    List<Post> elementos = Gestor().buscar(query);

    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        itemCount: elementos.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          return _buildPost(elementos[i ~/ 2]);
        });
  }


  @override
  Widget buildSuggestions(BuildContext context){
    List<String> suggestions = Gestor().getBusquedasRecientes();

    return ListView.builder(
      itemBuilder: (context, i) => ListTile(
        leading: Icon(Icons.lock_clock),
        title: Text(suggestions[i]),
      ),
      itemCount: suggestions.length,
    );
  }

  Widget _buildPost(Post post){
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