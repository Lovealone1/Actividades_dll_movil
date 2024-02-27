import 'package:dll_movil/models/Users.dart';
void main() async {
  List<Usuario> listaUsuarios = await Usuario.obtenerUsuarios();
  listaUsuarios.forEach((usuario) {
    print('ID: ${usuario.id}');
    print('Nombre: ${usuario.nombre} ${usuario.apellido}');
    print('Correo: ${usuario.correo}');
  });
}