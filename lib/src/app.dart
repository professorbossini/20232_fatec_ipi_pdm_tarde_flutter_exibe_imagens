import 'dart:convert';

import 'package:exibe_imagens/src/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'widgets/image_list.dart';
class App extends StatefulWidget {
  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int currentPage = 1;
  List <ImageModel> imagens = [];
  void obterImagem() async {
    var url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {'query': 'whatever', 'page': '$currentPage', 'per_page': '1'}
    );
    var req = http.Request('get', url);
    req.headers.addAll(
      {'Authorization': '563492ad6f91700001000001e00b21ab6afb45a18c1d44a759556f14'}
    );
    //async/await
    //js: usamos async/await para tratar promises
    //dart: usamos async/await para tratar futures
    final result = await req.send();
    if (result.statusCode == 200){
      final response = await http.Response.fromStream(result);
      //transformar o JSON (que é string) num mapa
      var decodedJSON = json.decode(response.body);
      //transformar o mapa num objeto ImageModel
      var imagem = ImageModel.fromJSON(decodedJSON);
      setState(() {
        currentPage++;
        imagens.add(imagem);
      });
    }
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
        body: ImageList(imagens)
      ),
    );
  }
}
