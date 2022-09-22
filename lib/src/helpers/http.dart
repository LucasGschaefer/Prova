
import 'dart:convert';
import 'dart:html';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpHelper {
  get http => null;
  
  Future<List<Receitas>>? get receitas => null;

  Future<List<Receitas>> getReceitas() async {

    var dotenv;
    Uri uri = new Uri(
        scheme: 'https',
        host: dotenv.env['HOST'],
        path: '3/pao/upcoming',
        queryParameters: {
          'api_key': dotenv.env['API_KEY'],
          'language': dotenv.env['LANGUAGE']
        });

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final receitasMap = json['results'] as List;

      List Receitas =
          receitasMap.map((data) => Receitas.fromJson(data)).toList();

      return receitas;

    } else {
      return [];
    }
  }

  Future<List> buscaPao(String titulo) async {
    print(titulo);
    Uri uri = new Uri(
        scheme: 'https',
        host: dotenv.env['HOST'],
        path: '3/search/receitas',
        queryParameters: {
          'api_key': dotenv.env['API_KEY'],
          'language': dotenv.env['LANGUAGE'],
          'query': titulo
        });

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final receitasMap = json['results'] as List;

      List receitas =
          receitasMap.map((data) => Pao.fromJson(data)).toList();

      return receitas;

    } else {
      return [];
    }
  }

  Future<String> adicionarFavoritos(int id) async {
    Uri uri = new Uri(
        scheme: 'http',
        host: dotenv.env['HOST'],
        path: '3/list/8217279/add_item',
        queryParameters: {
          'api_key': dotenv.env['API_KEY'],
          'session_id': dotenv.env['SESSION_ID'],
          'language': dotenv.env['LANGUAGE'],
        });

    http.Response response = await http.post(uri,
        body: jsonEncode(<String, int>{
          'media_id': id.toInt(),
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return "Item adicionado os Favoritos";
    } else {
      return "Houve erro ao adicionar os Favoritos";
    }
  }

  Future<String> removerFavoritos(int id) async {
    Uri uri = new Uri(
        scheme: 'https',
        host: dotenv.env['HOST'],
        path: '3/list/8217279/remove_item',
        queryParameters: {
          'api_key': dotenv.env['API_KEY'],
          'session_id': dotenv.env['SESSION_ID'],
          'language': dotenv.env['LANGUAGE'],
        });

    http.Response response = await http.post(uri,
        body: jsonEncode(<String, int>{
          'media_id': id.toInt(),
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return "Item removido dos Favoritos";
    } else {
      return "Houve erro ao remover dos Favoritos";
    }
  }

  Future<List<Pao>> getFavoritos() async {
    Uri uri = new Uri(
        scheme: 'https',
        host: dotenv.env['HOST'],
        path: '3/list/8217279',
        queryParameters: {
          'api_key': dotenv.env['API_KEY'],
          'language': dotenv.env['LANGUAGE']
        });

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final receitasMap = json['items'] as List;

      List<Pao> receitas =
          receitasMap.map((data) => Pao.fromJson(data)).toList();

      return receitas;
    } else {
      return [];
    }
  }
}

class Pao {
  String get posterPath => null;

  String? get titulo => null;

  String get descricao => null;

  get id => null;
  
  static fromJson(data) {}
}

class Receitas {
}
