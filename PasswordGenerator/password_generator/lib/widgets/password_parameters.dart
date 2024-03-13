import 'package:flutter/material.dart';
import 'dart:math';

enum PasswordType { easyToSay, easyToRead, allCharacters }

class PasswordLengthWidget extends StatefulWidget {
  final void Function(String) passwordUpdateCallback; // Define el callback como un parámetro

  PasswordLengthWidget({
    required this.passwordUpdateCallback, // Declara el callback como requerido
  });

  @override
  _PasswordLengthWidgetState createState() => _PasswordLengthWidgetState();
}

class _PasswordLengthWidgetState extends State<PasswordLengthWidget> {
  late TextEditingController _lengthController;
  int _passwordLength = 8;
  PasswordType _passwordType = PasswordType.easyToSay;

  bool _includeUppercase = false;
  bool _includeLowercase = false;
  bool _includeNumbers = false;
  bool _includeSymbols = false;

  @override
  void initState() {
    super.initState();
    _lengthController = TextEditingController(text: _passwordLength.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: Color.fromARGB(255, 255, 255, 255),
      surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personalice su contraseña',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('Longitud de contraseña:'),
                SizedBox(width: 8.0),
                SizedBox(
                  width: 55.0,
                  child: TextField(
                    controller: _lengthController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    ),
                    style: TextStyle(fontSize: 14.0),
                    onChanged: (value) {
                      int? parsedValue = int.tryParse(value);
                      if (parsedValue != null && parsedValue >= 1 && parsedValue <= 20) {
                        setState(() {
                          _passwordLength = parsedValue;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Slider(
              value: _passwordLength.toDouble(),
              min: 1,
              max: 20,
              divisions: 19,
              onChanged: (double value) {
                setState(() {
                  _passwordLength = value.round();
                  _lengthController.text = _passwordLength.toString();
                  // Llama a la función para generar la contraseña automáticamente
                  _updatePassword();
                });
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile<PasswordType>(
                  title: Text('Fácil de decir'),
                  value: PasswordType.easyToSay,
                  groupValue: _passwordType,
                  onChanged: (PasswordType? value) {
                    setState(() {
                      _passwordType = value!;
                      // Desactivar los checkboxes no necesarios si la opción es "Fácil de decir"
                      _includeNumbers = false;
                      _includeSymbols = false;
                      // Asegurarse de que al menos un checkbox esté seleccionado
                      if (!_includeUppercase && !_includeLowercase) {
                        _includeUppercase = true;
                      }
                      _updatePassword(); // Actualiza la contraseña cuando cambia el tipo
                    });
                  },
                ),
                RadioListTile<PasswordType>(
                  title: Text('Fácil de leer'),
                  value: PasswordType.easyToRead,
                  groupValue: _passwordType,
                  onChanged: (PasswordType? value) {
                    setState(() {
                      _passwordType = value!;
                      _updatePassword(); // Actualiza la contraseña cuando cambia el tipo
                    });
                  },
                ),
                RadioListTile<PasswordType>(
                  title: Text('Todos los caracteres'),
                  value: PasswordType.allCharacters,
                  groupValue: _passwordType,
                  onChanged: (PasswordType? value) {
                    setState(() {
                      _passwordType = value!;
                      _updatePassword(); // Actualiza la contraseña cuando cambia el tipo
                    });
                  },
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Checkbox(
                      value: _includeUppercase,
                      onChanged: (bool? value) {
                        setState(() {
                          _includeUppercase = value!;
                          // Asegurar que al menos una de las dos opciones (mayúsculas o minúsculas) esté seleccionada
                          if (!_includeUppercase && !_includeLowercase) {
                            _includeLowercase = true;
                          }
                          _updatePassword(); // Actualiza la contraseña cuando cambian las opciones
                        });
                      },
                    ),
                    Text('Mayúsculas'),
                    Checkbox(
                      value: _includeLowercase,
                      onChanged: (bool? value) {
                        setState(() {
                          _includeLowercase = value!;
                          // Asegurar que al menos una de las dos opciones (mayúsculas o minúsculas) esté seleccionada
                          if (!_includeUppercase && !_includeLowercase) {
                            _includeUppercase = true;
                          }
                          _updatePassword(); // Actualiza la contraseña cuando cambian las opciones
                        });
                      },
                    ),
                    Text('Minúsculas'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _includeNumbers,
                      onChanged: _passwordType == PasswordType.easyToSay ? null : (bool? value) {
                        setState(() {
                          _includeNumbers = value!;
                          _updatePassword(); // Actualiza la contraseña cuando cambian las opciones
                        });
                      },
                    ),
                    Text('Números'),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(width: 18),
                          Checkbox(
                            value: _includeSymbols,
                            onChanged: _passwordType == PasswordType.easyToSay ? null : (bool? value) {
                              setState(() {
                                _includeSymbols = value!;
                                _updatePassword(); // Actualiza la contraseña cuando cambian las opciones
                              });
                            },
                          ),
                          Text('Símbolos'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _lengthController.dispose();
    super.dispose();
  }

  void _updatePassword() {
    // Llama a la función para generar la contraseña automáticamente
    widget.passwordUpdateCallback(_generatePassword());
  }

  String _generatePassword() {
    switch (_passwordType) {
      case PasswordType.easyToSay:
        return _generateEasyToSayPassword();
      case PasswordType.easyToRead:
        return _generateEasyToReadPassword();
      case PasswordType.allCharacters:
        return _generateAllCharactersPassword();
      default:
        return _generateEasyToSayPassword();
    }
  }

  String _generateEasyToSayPassword() {
    String characters = '';
    if (_includeUppercase) characters += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (_includeLowercase) characters += 'abcdefghijklmnopqrstuvwxyz';
    // No incluir números ni símbolos si es "Fácil de decir"

    if (characters.isEmpty) return ''; // Manejar el caso cuando no se selecciona ningún tipo de carácter

    String password = '';
    final random = Random();
    for (int i = 0; i < _passwordLength; i++) {
      password += characters[random.nextInt(characters.length)];
    }
    return password;
  }


  String _generateEasyToReadPassword() {
    String characters = '';
    if (_includeUppercase) characters += 'ABCDEFGHJKLMNPQRSTUVWXYZ'; // Excluye 'I' para evitar confusiones con '1'
    if (_includeLowercase) characters += 'abcdefghijkmnpqrstuvwxyz'; // Excluye 'l' para evitar confusiones con '1'
    if (_includeNumbers) characters += '23456789'; // Excluye '0' y '1' para evitar confusiones
    // No incluir símbolos si es "Fácil de leer"
    
    String password = '';
    final random = Random();
    for (int i = 0; i < _passwordLength; i++) {
      password += characters[random.nextInt(characters.length)];
    }
    return password;
  }

  String _generateAllCharactersPassword() {
    String characters = '';
    if (_includeUppercase) characters += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (_includeLowercase) characters += 'abcdefghijklmnopqrstuvwxyz';
    if (_includeNumbers) characters += '0123456789';
    if (_includeSymbols) characters += '!@#\$%^&*()_+{}|:<>?~-=[];,./';

    String password = '';
    final random = Random();
    for (int i = 0; i < _passwordLength; i++) {
      password += characters[random.nextInt(characters.length)];
    }
    return password;
  }

}
