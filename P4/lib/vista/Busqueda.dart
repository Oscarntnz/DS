import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controlador/Gestor.dart';
import '../modelo/Post.dart';
import 'InterfazPost.dart';

class Busqueda extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Post> elementos = Gestor().buscar(query);

    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        itemCount: elementos.length * 2,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          return InterfazPost(post: elementos[i ~/ 2]);
        });
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = Gestor().getBusquedasRecientes();

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return ListView.builder(
            itemBuilder: (context, i) =>
                ListTile(
                  leading: Icon(Icons.lock_clock),
                  title: Text(suggestions[i]),
                ),
            itemCount: suggestions.length,
          );
        }
      );
  }
}