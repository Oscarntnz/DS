import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_2/controlador/Gestor.dart';
import 'package:p_2/modelo/Post.dart';
import 'package:intl/intl.dart';
import 'Perfil.dart';

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

          return _buildPost(elementos[i ~/ 2], context);
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

  Widget _buildPost(Post post, BuildContext context){
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