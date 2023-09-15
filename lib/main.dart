//exibir um componente textual
//importar o pacote que contém o Widget
import 'package:flutter/material.dart';

//escrever a função main, ponto de partida
void main() {
  //criar o Widget que exibirá o texto
  //exibir o Widget na tela
  var app = const MaterialApp(
    home: Text('Hello, Flutter'),
  );
  runApp(app);
}
