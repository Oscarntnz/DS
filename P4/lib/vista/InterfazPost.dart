import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:p_2/modelo/Post.dart';
import 'Perfil.dart';
import 'package:p_2/controlador/Gestor.dart';

class InterfazPost extends StatefulWidget {
  InterfazPost({@required this.post});
  final Post post;

  _InterfazPost createState() => _InterfazPost();
}

class _InterfazPost extends State<InterfazPost> {
  IconData _iconoLike;
  int _nLikes;

  IconData getIcono(bool like) {
    if(like)
      return Icons.favorite;
    else
      return Icons.favorite_border;
  }

  Widget build(BuildContext context) {
    final _estiloTexto = TextStyle(fontSize: 20.0);
    final _estiloAutor = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
    final DateFormat formatter = DateFormat("H:m - dd\\MM\\yyyy");
    _nLikes = Gestor().getLikes(widget.post);
    _iconoLike = getIcono(Gestor().haDadoLike(widget.post));

    return ListTile(
      title: InkWell(
        child: Text(
          widget.post.getAutor().getNombre(),
          style: _estiloAutor,
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Perfil(usuario: widget.post.getAutor()))).then((value) => setState(() {})),
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            widget.post.getTexto(),
            style: _estiloTexto,
          ),
        ),
        Text(formatter.format(widget.post.getFecha())),
        Align(
          child: Text(_nLikes.toString()),
          alignment: Alignment.bottomRight,
        ),
        Align(
          child: IconButton(
            icon: Icon(_iconoLike),
            onPressed: () => setState(() =>
               _iconoLike = getIcono(Gestor().toggleLike(widget.post))
            ),
          ),
          alignment: Alignment.bottomRight,
        )
      ]),
      isThreeLine: true,
    );
  }
}