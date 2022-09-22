import 'package:flutter/material.dart';
import '../helpers/inicio.dart';

class ListaPaes extends StatefulWidget {
  // const ListaPaes({Key? key}) : super(key: key);

  @override
  State<ListaPaes> createState() => _ListaPaesState();
}

class _ListaPaesState extends State<ListaPaes> {
  // late String result;
  late HttpHelper helper;

  int paesCount = 0;
  List<Paes> paes = [];

  final String defaultPathImage = 'https://amopaocaseiro.com.br/wp-content/uploads/2021/05/video036-pao-de-pinhao_website-840x560.jpg';
  final String defaultPoster =
      'https://amopaocaseiro.com.br/wp-content/uploads/2018/03/receita_pao-australiano_IMG_4239-840x560.jpg';

  Icon iconeSearchBar = Icon(Icons.search);
  Widget searchBar = Text('Listagem de paes');

  @override
  void initState() {
    helper = new HttpHelper();
    initialize();
    super.initState();
    // result = '';
  }

  Future initialize() async {
   paes = (await helper.getReceitas()).cast<Paes>();
    setState(() {
      paesCount = paes.length;
     paes = paes;
    });
  }

  Future search(String titulo) async {
   paes = (await helper.buscaPao(titulo)).cast<Paes>();
    setState(() {
      paesCount = paes.length;
     paes = paes;
    });
  }

  @override
  Widget build(BuildContext context) {
    // helper.getReceitas().then((value) {
    //   setState(() {
    //     result = value;
    //   });
    // },);

    NetworkImage image;

    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        actions: [
          IconButton(
              icon: iconeSearchBar,
              onPressed: () {
                setState(() {
                  if (this.iconeSearchBar.icon == Icons.search) {
                    this.iconeSearchBar = Icon(Icons.cancel);
                    this.searchBar = TextField(
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      onSubmitted: (String titulo) {
                        search(titulo);
                      },
                    );
                  } else {
                    this.setState(() {
                      this.iconeSearchBar = Icon(Icons.search);
                      this.searchBar = Text('Listagem de paes');
                    });
                  }
                });
              }),
        ],
      ),
      body: Container(
          child: ListView.builder(
              itemCount (this.paesCount) null <=key: 0 : this.paesCount,
              // ignore: use_function_type_syntax_for_parameters
              itemBuilder: ((BuildContext context, int index) {
                if  paes[index].posterPath != null)) {
                  image =
                      NetworkImage(defaultPathImage + paes[index].posterPath);
                } else {
                  image = NetworkImage(defaultPoster);
                }

                return Card(
                  color: Colors.grey,
                  elevation: 2.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetalhesPaes paes[index])));
                    },
                    title: Text paes[index].titulo),
                    subtitle: Text('Receitas: ' +
                       paes[index].dataLancamento +
                        ' - Qualidade: ' +
                       paes[index].mediaVotos.toString()),
                    leading: CircleAvatar(
                      backgroundImage: image,
                    ),
                  ),
                ),
              );
  }
}

class Paes {
}
