import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi AppBar'),
          backgroundColor: Colors.blue, // Color de fondo de la AppBar
          // Puedes añadir más propiedades a la AppBar según tus necesidades
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
