import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario {
  late int id;
  late String nombre;
  late String correo;
  late String apellido;

  Usuario() {
    id = 0;
    nombre = '';
    correo = '';
    apellido = '';
  }

    Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0; // Asigna 0 si 'id' es nulo
    nombre = json['first_name'] ?? ''; // Asigna una cadena vacía si 'first_name' es nulo
    apellido = json['last_name'] ?? ''; // Asigna una cadena vacía si 'last_name' es nulo
    correo = json['email'] ?? ''; // Asigna una cadena vacía si 'email' es nulo
  }

    static Future<List<Usuario>> obtenerUsuarios() async {
  try {
    var url = Uri.parse("https://reqres.in/api/users?page=2");
    http.Response response = await http.get(url);
    
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> usuariosData = responseData['data'];
      List<Usuario> listaUsuarios = [];
      usuariosData.forEach((userData) {
        Usuario usuario = Usuario.fromJson(userData);
        listaUsuarios.add(usuario);
      });
      return listaUsuarios;
    } else {
      throw Exception('Error al obtener los usuarios: ${response.statusCode}');
    }
  } catch (e) {
    // Captura cualquier excepción y la imprime en la consola
    print('Error en la solicitud HTTP: $e');
    // Lanza la excepción nuevamente para que el llamador la maneje si es necesario
    throw e;
  }
}
}