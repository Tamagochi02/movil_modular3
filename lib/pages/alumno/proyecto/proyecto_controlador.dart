import 'dart:convert';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/modelos/usuario.dart';
import 'package:movil_modular3/utils/config.dart';

class ProjectController {
  Future<bool> crearProyecto(
      String nombre, String modulo, String correos) async {
    final response = await http.post(
      Uri.parse('${Config.ipServerApiUrl}/projects'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
              "nombre": nombre,
              "modulo": modulo,
              "correos": correos
            })
    );
    print(">> El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode != 200) return false;
    return true;
  }

  Future<List<Project>> obtenerProyectosPorUsuarioId() async {
    final response = await http
        .get(Uri.parse('${Config.ipServerApiUrl}/projects'), headers: {
      'Content-Type': 'application/json',
      "Cookie": Session().cookie
    });
    print(">> El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  Future<Project> obtenerProyectosPorId(String id) async {
    final response = await http.get(
      Uri.parse('${Config.ipServerApiUrl}/projects'),
      headers: {'Content-Type': 'application/json', "Cookie": Session().cookie},
    );
    print(">> El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['proyectos'];
    } else {
      throw Exception('Failed to load projects');
    }
  }

  Future<List<User>> obtenerAlumnos() async {
    final response = await http
        .get(Uri.parse('${Config.ipServerApiUrl}/alumnos'), headers: {
      'Content-Type': 'application/json',
      "Cookie": Session().cookie
    });
    print(">> El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      var registros = <User>[];

      for (var datos in jsonResponse) {
        registros.add(User.fromJson(datos));
      }
      return registros;
    } else {
      throw Exception('Failed to load alumnos');
    }
  }

  Future<List<User>> obtenerDocentes() async {
    final response = await http
        .get(Uri.parse('${Config.ipServerApiUrl}/docentes'), headers: {
      'Content-Type': 'application/json',
      "Cookie": Session().cookie
    });
    print(">> El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      var registros = <User>[];

      for (var datos in jsonResponse) {
        registros.add(User.fromJson(datos));
      }
      return registros;
    } else {
      throw Exception('Failed to load Docentes');
    }
  }
}

/* l()async {
  final pc = ProjectController();
final proyects = await pc.obtenerProyectosPorUsuarioId();
final p = await pc.obtenerProyectosPorId(proyects.first.id);
} */