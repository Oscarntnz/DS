import 'package:http/http.dart' as http;
import 'dart:convert';
import '../modelo/Usuario.dart';
import 'Gestor.dart';
import '../modelo/Post.dart';

class BD {
  static const String _URL = "clados.ugr.es";
  static const String _jsonHeader = "application/json; charset=UTF-8";

  BD._constructorPrivado();

  static final BD _instance = BD._constructorPrivado();

  factory BD() {
    return _instance;
  }

  Future<List<Usuario>> getAllUsuarios() async {
    final u = await http.get(Uri.http(_URL, 'DS12/usuarios.json'),
        headers: {"Content-Type": _jsonHeader});
    final s = await http.get(Uri.http(_URL, 'DS12/seguidos.json'),
        headers: {"Content-Type": _jsonHeader});

    if (u.statusCode == 200 && s.statusCode == 200) {
      var usersJSON = json.decode(u.body);
      var seguidoresJSON = json.decode(s.body);

      usersJSON.forEach((e) {
        Gestor().addUsuario(Usuario.fromJson(e));
      });

      Gestor().getUsuarios().forEach((usuario) {
        insertarSeguido(usuario, seguidoresJSON: seguidoresJSON);
      });
    }
    else
      throw Exception('Failed to load load User');

    return Gestor().getUsuarios();
  }

  void insertarSeguido(Usuario u, {var seguidoresJSON}) async {
    if(seguidoresJSON == null) {
      final res = await http.get(Uri.http(_URL, 'DS12/seguidos.json'),
          headers: {"Content-type" : _jsonHeader});

      if (res.statusCode == 200)
        seguidoresJSON = json.decode(res.body);
      else
        throw Exception('Failed to load Seguidores Seguidos');
    }

    seguidoresJSON.forEach((json) {
      if(u.getId() == json['usuarioSeguidor'])
        Gestor().cargarSeguir(Gestor().getUsuarioById(json['usuarioSeguido']), quien: u);
    });
  }

  Future<List<Post>> getAllPosts() async {
    final p = await http.get(Uri.http(_URL, 'DS12/posts.json'),
        headers: {"Content-Type": _jsonHeader});
    final l = await http.get(Uri.http(_URL, 'DS12/likes.json'),
        headers: {"Content-Type": _jsonHeader});
    final e = await http.get(Uri.http(_URL, 'DS12/etiqueta.json'),
        headers: {"Content-Type": _jsonHeader});

    if(p.statusCode == 200 && l.statusCode == 200 && e.statusCode == 200) {
      var postsJSON = json.decode(p.body);
      var likesJSON = json.decode(l.body);
      var tagsJSON = json.decode(e.body);

      postsJSON.forEach((e) {
        Gestor().addPost(Post.fromJson(e))
            .setAutor(Gestor().getUsuarioById(e['usuario_id']));
      });

      likesJSON.forEach((e) {
        Gestor().getPostById(e['post_id']).toggleLike(Gestor().getUsuarioById(e['usuario_id']));
      });

      tagsJSON.forEach((e) {
        Gestor().getPostById(e['postId']).addEtiqueta(e['etiqueta']);
      });
    }
    else
      throw Exception('Failed to load Posts');

    return Gestor().getAllPublicaciones();
  }

  Future<bool> subirPost(Post p) async {
    final res = await http.post(Uri.http(_URL, 'DS12/posts.json'), headers: 
    {"Content-Type": _jsonHeader}, body: jsonEncode(p));

    if(res.statusCode == 201) {
      final resJSON = jsonDecode(res.body);

      p.setId(resJSON['id']);

      if(p.getEtiquetas().isNotEmpty) {
        p.getEtiquetas().forEach((e) async {
          final rTags = await http.post(Uri.http(_URL, 'DS12/etiqueta.json'),
              headers: {"Content-Type": _jsonHeader}, body: jsonEncode({
                "postId": p.getId(),
                "etiqueta": e
              }));

          if(rTags.statusCode != 201)
            throw Exception('Failed to upload Tags');
        });
      }

      Gestor().addPost(p);

      return true;
    }
    else
      throw Exception('Failed to upload Post');
  }

  Future<bool> subirUsuario(Usuario u) async {
    final res = await http.post(Uri.http(_URL, 'DS12/usuarios.json'), headers: 
    {"Content-Type": _jsonHeader}, body: jsonEncode(u));

    if(res.statusCode == 201) {
      final resJSON = jsonDecode(res.body);

      u.setId(resJSON['id']);

      Gestor().addUsuario(u);

      return true;
    }
    else
      throw Exception('Failed to upload Post');
  }

  Future<bool> darLike(Post p, Usuario u) async {
    Map<String, dynamic> like = {
      "post_id": p.getId(),
      "usuario_id": u.getId(),
    };

    final res = await http.post(Uri.http(_URL, 'DS12/likes.json'), headers:
    {"Content-Type": _jsonHeader}, body: jsonEncode(like));

    if(res.statusCode == 201)
      return true;
    else
      throw Exception('Failed to upload Like');
  }

  Future<bool> quitarLike(Post p, Usuario u) async {
    final res = await http.delete(Uri.http(_URL,
        'DS12/likes/${p.getId().toString()}/${u.getId().toString()}.json'));

    if(res.statusCode == 204)
      return true;
    else
      throw Exception('Failed to delete Like');
  }

  Future<bool> subirSeguido(Usuario seguidor, Usuario seguido) async {
    Map<String, dynamic> seg = {
      "usuarioSeguidor": seguidor.getId(),
      "usuarioSeguido": seguido.getId(),
    };

    final res = await http.post(Uri.http(_URL, 'DS12/seguidos.json'), headers:
    {"Content-Type": _jsonHeader}, body: jsonEncode(seg));

    if(res.statusCode == 201)
      return true;
    else
      throw Exception('Failed to upload Seguir');
  }

  Future<bool> quitarSeguido(Usuario seguidor, Usuario seguido) async {
    final res = await http.delete(Uri.http(_URL,
      'DS12/seguidos/${seguidor.getId().toString()}/${seguido.getId().toString()}.json'));

    if(res.statusCode == 204)
      return true;
    else
      throw Exception('Failed to delete Seguir');
  }
}