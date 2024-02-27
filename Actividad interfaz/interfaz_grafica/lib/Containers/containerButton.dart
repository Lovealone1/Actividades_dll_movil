import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), // Reducir el padding superior
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            // Add functionality for when the card is tapped here.
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildColumn(Icons.phone, 'CALL', Colors.blueAccent),
                SizedBox(width: 68),
                _buildColumn(Icons.near_me, 'ROUTE', Colors.blueAccent),
                SizedBox(width: 68),
                _buildColumn(Icons.share, 'SHARE', Colors.blueAccent),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(IconData iconData, String text, Color color) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 24,
          color: color, // Color del icono
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: color, // Color del texto
          ),
        ),
      ],
    );
  }
}
