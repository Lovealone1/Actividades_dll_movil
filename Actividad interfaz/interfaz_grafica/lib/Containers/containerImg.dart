import 'package:flutter/material.dart';

class ContainerImg extends StatelessWidget {
  // Ruta de la imagen que cargaremos más tarde
  final String imagePath = 'assets/oeschinensee-camping-Lakes-in-Switzerland-1024x683.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Ocupa todo el ancho del dispositivo
      height: 230, // Altura ajustable, puedes ajustarla según necesites
      color: Colors.grey, // Color de fondo opcional
      child: Image.asset(
        imagePath, // Ruta de la imagen
        fit: BoxFit.cover, // Ajustar la imagen al contenedor
      ),
    );
  }
}
