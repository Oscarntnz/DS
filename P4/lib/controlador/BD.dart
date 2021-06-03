/*import 'package:http/http.dart' as http;
import 'dart:convert';

class Album {
  final String name;
  final int team;
  final String info;

  Album({
    this.name,
    this.team,
    this.info,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'],
      team: json['team'],
      info: json['info'],
    );
  }
}

void main() async {
  final res = await http.get(Uri.http('clados.ugr.es', 'DS12/projects/1'));

  if (res.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(Album.fromJson(jsonDecode(res.body)).name);
    print(Album.fromJson(jsonDecode(res.body)).team);
    print(Album.fromJson(jsonDecode(res.body)).info);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}*/