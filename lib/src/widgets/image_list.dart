import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> imagens;
  ImageList(this.imagens);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagens.length,
      itemBuilder: (BuildContext context, int index){
        //se o item estiver em posição par, exiba seu alt
        //se o item estiver em posição impar, exiba sua url
        //use o operador ternário
        return Text(index.isOdd ? imagens[index].url : imagens[index].alt);
      },
    );
  }
}