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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PasswordGenerator')),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldWithCopyAndReload(
                textController: _textController,
                displayText: _displayText,
              ),
              SizedBox(height: 16.0),
              PasswordLengthWidget(
                passwordUpdateCallback: _updatePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updatePassword(String newPassword) {
    setState(() {
      _displayText = newPassword;
      _textController.text = _displayText;
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
