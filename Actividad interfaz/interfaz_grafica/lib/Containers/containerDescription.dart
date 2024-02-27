import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  DescriptionWidget({required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Color blanco de fondo
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), // Borde alrededor del contenedor
        borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
      ),
      child: Padding(
        padding: EdgeInsets.all(7.0), // Márgenes internos del texto
        child: Text(
          description,
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.black87,
            height: 1.2, // Establecer el interlineado
          ),
        ),
      ),
    );
  }
}
