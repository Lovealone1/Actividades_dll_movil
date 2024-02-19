import 'dart:io';
import 'package:actividad_pacientes/models/pacientes-model.dart';

void main() async {
  bool continuar = true;

  while (continuar) {
    print('Menu:');
    print('1. Mostrar la lista de pacientes');
    print('2. Mostrar estadísticas generales');
    print('3. Mostrar puntos requeridos');
    print('4. Salir');
    print(''); 

    stdout.write('Ingrese el número de la opción que desea: ');

    String opcion = stdin.readLineSync() ?? '';

    switch (opcion) {
      case '1':
        mostrarListaPacientes();
        break;
      case '2':
        mostrarEstadisticasGenerales();
        break;
      case '3':
        mostrarPuntosRequeridos();
        break;
      case '4':
        continuar = false;
        print('Saliendo del programa...');
        break;
      default:
        print('Opción no válida, por favor ingrese un número del 1 al 4.');
    }
  }
}


void mostrarListaPacientes() async {
  try {
    List<Usuario> listaUsuarios = await Usuario.obtenerUsuarios();
    listaUsuarios.forEach((usuario) {
      stdout.writeln('ID: ${usuario.id}');
      stdout.writeln('Nombre: ${usuario.nombre} ${usuario.apellido}');
      stdout.writeln('Sexo: ${usuario.sexo}');
      stdout.writeln('Estado Civil: ${usuario.estadoCivil}');
      stdout.writeln('Edad: ${usuario.edad}');
      stdout.writeln('------------------------');
    });
  } catch (e) {
    stdout.writeln('Error al mostrar la lista de pacientes: $e');
  }
}

void mostrarEstadisticasGenerales() async {
  try {
    Map<String, int> recuentos = await Usuario.capturarRecuentos();

    stdout.writeln('Estadísticas Generales:');
    stdout.writeln('-----------------------');
    stdout.writeln('Total de Hombres: ${recuentos['totalHombres']}');
    stdout.writeln('Hombres Solteros: ${recuentos['hombresSolteros']}');
    stdout.writeln('Hombres Casados: ${recuentos['hombresCasados']}');
    stdout.writeln('Hombres Viudos: ${recuentos['hombresViudos']}');
    stdout.writeln('-----------------------');
    stdout.writeln('Total de Mujeres: ${recuentos['totalMujeres']}');
    stdout.writeln('Mujeres Solteras: ${recuentos['mujeresSolteras']}');
    stdout.writeln('Mujeres Casadas: ${recuentos['mujeresCasadas']}');
    stdout.writeln('Mujeres Viudas: ${recuentos['mujeresViudas']}');
    stdout.writeln('-----------------------');
  } catch (e) {
    stdout.writeln('Error al mostrar estadísticas generales: $e');
  }
}

void mostrarPuntosRequeridos() async {
  try {
    stdout.writeln('-----------------------');
    double porcentajeHombresSolteros = await Usuario.porcentajeHombresSolteros();
    stdout.writeln('Porcentaje de hombres solteros: $porcentajeHombresSolteros%');

    double edadPromedioHombresCasados = await Usuario.calcularEdadPromedioHombresCasados();
    stdout.writeln('Edad promedio de hombres casados: $edadPromedioHombresCasados años');

    double porcentajeMujeresSolteras = await Usuario.porcentajeMujeresSolteras();
    stdout.writeln('Porcentaje de mujeres solteras en base al total de usuarios: $porcentajeMujeresSolteras%');
    stdout.writeln('-----------------------');
  } catch (e) {
    stdout.writeln('Error: $e');
  }
}
