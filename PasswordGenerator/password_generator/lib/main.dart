import 'package:flutter/material.dart';
import 'package:password_generator/views/homepage.dart'; // Asegúrate de importar el archivo correcto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplePage(), // Aquí se llama al ExamplePage que contiene TextWithCopyAndReload
    );
  }
}
