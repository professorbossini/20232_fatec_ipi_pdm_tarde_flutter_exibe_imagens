import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class App extends StatefulWidget {
  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 0;
  void obterImagem(){
    var url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {'query': 'whatever', 'page': '1', 'per_page': '1'}
    );
    var req = http.Request('get', url);
    req.headers.addAll(
      {'Authorization': '563492ad6f91700001000001e00b21ab6afb45a18c1d44a759556f14'}
    );
    //async/await
    //js: usamos async/await para tratar promises
    //dart: usamos async/await para tratar futures
    req.send().then((result){
      if (result.statusCode == 200){
        http.Response.fromStream(result).then((response){
          print(response.body);
        });
      }
      else{
        print("Falhou");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minhas imagens'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: obterImagem,
            child: const Icon(Icons.add_a_photo_outlined)),
        body: Text('$numeroImagens'),
      ),
    );
  }
}
