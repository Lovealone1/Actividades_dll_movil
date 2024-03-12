import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  DescriptionWidget({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        description,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.black87,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
