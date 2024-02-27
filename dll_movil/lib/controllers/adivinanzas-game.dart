import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class Adivinanza {
  String adivinanza;
  String respuesta;

  Adivinanza(this.adivinanza, this.respuesta);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivinanzas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdivinanzasPage(),
    );
  }
}

class AdivinanzasPage extends StatefulWidget {
  @override
  _AdivinanzasPageState createState() => _AdivinanzasPageState();
}

class _AdivinanzasPageState extends State<AdivinanzasPage> {
  List<Adivinanza> listaAdivinanzas = [
    Adivinanza(
        "¿Cuál es el instrumento que se mete y deja líquido dentro?", "la jeringa"),
    Adivinanza("¿Cómo se denomina a un perro con fiebre?", "hot dog"),
    Adivinanza("¿Qué puede dar una vaca flaca?", "lastima"),
  ];

  late Adivinanza adivinanzaAleatoria;

  bool respuestaCorrecta = false;
  TextEditingController respuestaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    adivinanzaAleatoria = seleccionarAdivinanzaAleatoria();
  }

  Adivinanza seleccionarAdivinanzaAleatoria() {
    Random random = Random();
    int indiceAleatorio = random.nextInt(listaAdivinanzas.length);
    return listaAdivinanzas[indiceAleatorio];
  }

  void verificarRespuesta() {
    String respuestaUsuario = respuestaController.text.toLowerCase();
    setState(() {
      if (respuestaUsuario == adivinanzaAleatoria.respuesta.toLowerCase()) {
        respuestaCorrecta = true;
      } else {
        respuestaCorrecta = false;
      }
    });
  }

  void mostrarNuevaAdivinanza() {
    setState(() {
      respuestaController.clear();
      adivinanzaAleatoria = seleccionarAdivinanzaAleatoria();
      respuestaCorrecta = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinanzas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Adivinanza: ${adivinanzaAleatoria.adivinanza}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: respuestaController,
              decoration: InputDecoration(
                hintText: 'Ingrese su respuesta',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: verificarRespuesta,
              child: Text('Verificar respuesta'),
            ),
            SizedBox(height: 10.0),
            respuestaCorrecta == true
                ? Text(
                    '¡Respuesta correcta!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.green,
                    ),
                  )
                : respuestaCorrecta == false
                    ? Text(
                        'Respuesta incorrecta. La respuesta correcta es: ${adivinanzaAleatoria.respuesta}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      )
                    : SizedBox(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: mostrarNuevaAdivinanza,
              child: Text('Mostrar nueva adivinanza'),
            ),
          ],
        ),
      ),
    );
  }
}
