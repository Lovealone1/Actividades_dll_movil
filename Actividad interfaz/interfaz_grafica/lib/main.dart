import 'package:flutter/material.dart';
import 'package:interfaz_grafica/Containers/containerImg.dart';
import 'package:interfaz_grafica/Containers/containerTitle.dart';
import 'package:interfaz_grafica/Containers/containerButton.dart';
import 'package:interfaz_grafica/Containers/containerDescription.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar( // Título de la barra de aplicación
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerImg(), // Aquí va tu widget de imagen
            OeschinenLakeCampground(), 
            ButtonWidget(),   // Aquí va tu widget de título
            DescriptionWidget(
            description:
              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
            ),
          ],
        ),
      ),
    );
  }
}
