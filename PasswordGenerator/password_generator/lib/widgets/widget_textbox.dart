import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithCopyAndReload extends StatefulWidget {
  final TextEditingController textController;
  final String displayText; // Haz que displayText sea final

  TextFieldWithCopyAndReload({
    required this.textController,
    required this.displayText,
  });

  @override
  _TextFieldWithCopyAndReloadState createState() => _TextFieldWithCopyAndReloadState();
}

class _TextFieldWithCopyAndReloadState extends State<TextFieldWithCopyAndReload> {
  late TextEditingController _textController;
  late String _displayText; // Crear una variable de instancia para almacenar el texto

  @override
  void initState() {
    super.initState();
    _displayText = widget.displayText; // Inicializar _displayText con el valor de widget.displayText
    _textController = TextEditingController(text: _displayText);
    _textController.addListener(_updateDisplayText);
  }

  void _updateDisplayText() {
    if (_textController.text != _displayText) {
      setState(() {
        _displayText = _textController.text; // Actualizar _displayText cuando cambie el texto del controlador
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Material(
                elevation: 3.0, // Agrega elevación al Material
                borderRadius: BorderRadius.circular(4.0), 
                color: Colors.white,// Ajusta el radio de borde si es necesario
                child: TextField(
                  controller: widget.textController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Quita el borde de la TextField
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Ajusta el padding si es necesario
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: _copyText,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _copyText() {
    Clipboard.setData(ClipboardData(text: widget.textController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Texto copiado')),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
