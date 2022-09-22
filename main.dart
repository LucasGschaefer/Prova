import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future main() async {

  var dotenv;
  await dotenv.load(fileName: ".env");
  runApp(AppPao());
}

void runApp(AppPao appPao) {
}

class AppPao extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pão',
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Pão"),
          ),
          body: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.all(10),
                  child: Text(
                    'Bem-vindo ao amo pão caseiro',
                    // ignore: unnecessary_const
                    style: const TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: Image.network(
                      'https://amopaocaseiro.com.br/wp-content/uploads/2020/01/pao-caseiro-para-iniciantes_02-840x560.jpg',
                      height: 320),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ListaReceitas()));
                    },
                    child: const Text('Receitas'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FavoritosPao()));
                    },
                    child: const Text('Meus Preferidos'),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
  
  // ignore: non_constant_identifier_names
  ListaReceitas() {}
  
  // ignore: non_constant_identifier_names
  FavoritosPao() {}
}

class StatelessWidget {
}
