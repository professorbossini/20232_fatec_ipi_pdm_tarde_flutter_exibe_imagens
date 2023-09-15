import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minhas imagens'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                numeroImagens++;
              });
            },
            child: const Icon(Icons.add_a_photo_outlined)),
        body: Text('$numeroImagens'),
      ),
    );
  }
}
