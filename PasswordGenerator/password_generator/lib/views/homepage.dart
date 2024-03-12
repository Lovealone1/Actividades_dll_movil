import 'package:flutter/material.dart';
import 'package:password_generator/widgets/widget_textbox.dart';
import 'package:password_generator/widgets/password_parameters.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  late TextEditingController _textController;
  String _displayText = '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _updatePassword(_generatePassword()); // Actualiza la contraseña inicial al inicio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PasswordGenerator')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Muestra el TextField con la contraseña
            TextFieldWithCopyAndReload(
              textController: _textController,
              displayText: _displayText,
            ),
            SizedBox(height: 16.0), // Espacio entre los widgets
            Expanded(
              // Utiliza el widget PasswordLengthWidget para ajustar la longitud de la contraseña
              child: PasswordLengthWidget(
                passwordUpdateCallback: _updatePassword, // Actualiza la contraseña cuando cambian los parámetros
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para actualizar la contraseña y el texto mostrado
  void _updatePassword(String newPassword) {
    setState(() {
      _displayText = newPassword; // Actualiza el texto mostrado con la nueva contraseña
      _textController.text = _displayText; // Actualiza el controlador de texto con la nueva contraseña
    });
  }

  // Genera una contraseña inicial
  String _generatePassword() {
    // Aquí puedes implementar la lógica para generar una contraseña inicial
    return 'InitialPassword123'; // Ejemplo de contraseña inicial
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
