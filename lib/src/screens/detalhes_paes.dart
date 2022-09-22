import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/inicio.dart';

class DetalhesPaes extends StatelessWidget {
  final Pao pao;
  final String defaultPathImage = 'https://amopaocaseiro.com.br/wp-content/uploads/2021/05/video036-pao-de-pinhao_website-840x560.jpg';
  final String defaultPoster =
      'https://amopaocaseiro.com.br/wp-content/uploads/2018/03/receita_pao-australiano_IMG_4239-840x560.jpg';

  DetalhesPaes(this.pao);

  final HttpHelper http = HttpHelper();

  @override
  Widget build(BuildContext context) {
    String poster;
    double posterHeight = MediaQuery.of(context).size.height;
    if (pao.posterPath != null) {
      poster = defaultPathImage + pao.posterPath;
    } else {
      poster = defaultPoster;
    }

    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5),
                    height: posterHeight / 3,
                    child: Image.network(poster)),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(pao.descricao),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String status = await http.adicionarFavoritos(pao.id);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(status)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BuildContext {
}

class HttpHelper {
  adicionarFavoritos(id) {}
}
