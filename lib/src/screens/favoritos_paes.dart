
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/inicio.dart';

class FavoritosPaes extends StatefulWidget {
  // const FavoritosPaes({Key? key}) : super(key: key);

  @override
  State<FavoritosPaes> createState() => _FavoritosPaesState();
}

class _FavoritosPaesState extends State<FavoritosPaes> {
  // late String result;
  late HttpHelper helper;

  // ignore: non_constant_identifier_names
  int paesCount = 0;
  List<paes> paes = [];

  final String defaultPathImage = 'https://amopaocaseiro.com.br/wp-content/uploads/2021/05/video036-pao-de-pinhao_website-840x560.jpg';
  final String defaultPoster =
      'https://amopaocaseiro.com.br/wp-content/uploads/2018/03/receita_pao-australiano_IMG_4239-840x560.jpg';

  @override
  void initState() {
    helper = new HttpHelper();
    initialize();
    super.initState();
    // result = '';
  }

  Future initialize() async {
    paes = await helper.getFavoritos();
    setState(() {
      paesCount = paes.length;
      paes = paes;
    });
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: (this.paesCount == null) ? 0 : this.paesCount,
              itemBuilder: ((BuildContext context, int index) {
                if (paes[index].posterPath != null) {
                  image =
                      NetworkImage(defaultPathImage + paes[index].posterPath);
                } else {
                  image = NetworkImage(defaultPoster);
                }

                return Dismissible(
                  key: Key(paes[index].id.toString()),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                                'Deseja realmente remover dos favoritos?'),
                            actions: <Widget>[
                              TextButton(
                                  child: const Text('Sim'),
                                  onPressed: () async {
                                    String status = await helper
                                        .removerFavoritos(paes[index].id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(status)));
                                    Navigator.of(context).pop(true);
                                  }),
                              TextButton(
                                child: const Text('Não'),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                              ),
                            ],
                          );
                        });
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Detalhespaes(paes[index])));
                      },
                      title: Text(paes[index].titulo),
                      subtitle: Text('Receitas: ' +
                          paes[index].dataLancamento +
                          ' - Qualidade: ' +
                          paes[index].mediaQualidade.toString()),
                      leading: CircleAvatar(
                        backgroundImage: image,
                      ),
                    ),
                  ),
                );
              }))),
    );
  }
  
  Detalhespaes(pa) {}
}

class paes {
}
