import 'dart:convert';
import 'dart:io';

class Usuario {
  late int id;
  late String nombre;
  late String apellido;
  late String sexo;
  late String estadoCivil;
  late int edad;

  Usuario();

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    nombre = json['nombre'] ?? '';
    apellido = json['apellido'] ?? '';
    sexo = json['sexo'] ?? '';
    estadoCivil = json['estado_civil'] ?? '';
    edad = json['edad'] ?? 0;
  }

  static Future<List<Usuario>> obtenerUsuarios() async {
    try {
      String jsonString = await File('C:/Users/dgo34/Desktop/DlloMovil/Clase 3/dllo_movil/lib/pacientes.json').readAsString();
      List<dynamic> usuariosData = jsonDecode(jsonString);
      List<Usuario> listaUsuarios = usuariosData.map((json) => Usuario.fromJson(json)).toList();
      return listaUsuarios;
    } catch (e) {
      print('Error al leer el archivo JSON: $e');
      throw e;
    }
  }

  static Future<double> porcentajeHombresSolteros() async {
    try {
      List<Usuario> usuarios = await obtenerUsuarios();

      int totalHombres = 0;
      int hombresSolteros = 0;

      for (Usuario usuario in usuarios) {
        if (usuario.sexo == 'hombre') {
          totalHombres++;
          if (usuario.estadoCivil == 'soltero') {
            hombresSolteros++;
          }
        }
      }

      double porcentaje = (hombresSolteros / totalHombres) * 100;
      double porcentajeRedondeado = double.parse(porcentaje.toStringAsFixed(2));
      return porcentajeRedondeado;
    } catch (e) {
      print('Error al calcular el porcentaje de hombres solteros: $e');
      rethrow;
    }
  }

  static Future<double> calcularEdadPromedioHombresCasados() async {
    try {
      List<Usuario> usuarios = await obtenerUsuarios();

      int totalEdades = 0;
      int cantidadHombresCasados = 0;

      for (Usuario usuario in usuarios) {
        if (usuario.sexo == 'hombre' && usuario.estadoCivil == 'casado') {
          totalEdades += usuario.edad;
          cantidadHombresCasados++;
        }
      }

      double edadPromedio = cantidadHombresCasados > 0
      ? totalEdades / cantidadHombresCasados
      : 0; 

      double edadRedondeada = double.parse(edadPromedio.toStringAsFixed(0));
      return edadRedondeada;

    } catch (e) {
      print('Error al calcular la edad promedio de hombres casados: $e');
      rethrow;
    }
  }

  static Future<double> porcentajeMujeresSolteras() async {
  try {
    List<Usuario> usuarios = await obtenerUsuarios();

    int totalSolteros = 0;
    int mujeresSolteras = 0;

    for (Usuario usuario in usuarios) {
      if (usuario.estadoCivil == 'soltero') {
        totalSolteros++;
        if (usuario.sexo == 'mujer') {
          mujeresSolteras++;
        }
      }
    }

    double porcentaje = (mujeresSolteras / totalSolteros) * 100;
    double porcentajeRedondeado = double.parse(porcentaje.toStringAsFixed(2));
    return porcentajeRedondeado;
  } catch (e) {
    print('Error al calcular el porcentaje de mujeres solteras: $e');
    rethrow;
  }
}

  static Future<Map<String, int>> capturarRecuentos() async {
    try {
      List<Usuario> usuarios = await obtenerUsuarios();

      int totalHombres = 0;
      int totalMujeres = 0;
      int hombresSolteros = 0;
      int hombresCasados = 0;
      int hombresViudos = 0;
      int mujeresSolteras = 0;
      int mujeresCasadas = 0;
      int mujeresViudas = 0;

      for (Usuario usuario in usuarios) {
        if (usuario.sexo == 'hombre') {
          totalHombres++;
          if (usuario.estadoCivil == 'soltero') {
            hombresSolteros++;
          } else if (usuario.estadoCivil == 'casado') {
            hombresCasados++;
          } else if (usuario.estadoCivil == 'viudo') {
            hombresViudos++;
          }
        } else if (usuario.sexo == 'mujer') {
          totalMujeres++;
          if (usuario.estadoCivil == 'soltero') {
            mujeresSolteras++;
          } else if (usuario.estadoCivil == 'casado') {
            mujeresCasadas++;
          } else if (usuario.estadoCivil == 'viudo') {
            mujeresViudas++;
          }
        }
      }

      Map<String, int> recuentos = {
        'totalHombres': totalHombres,
        'totalMujeres': totalMujeres,
        'hombresSolteros': hombresSolteros,
        'hombresCasados': hombresCasados,
        'hombresViudos': hombresViudos,
        'mujeresSolteras': mujeresSolteras,
        'mujeresCasadas': mujeresCasadas,
        'mujeresViudas': mujeresViudas,
      };

      return recuentos;
    } catch (e) {
      print('Error al capturar los recuentos: $e');
      rethrow;
    }
  }

}
