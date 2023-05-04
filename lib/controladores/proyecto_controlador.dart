import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/modelos/usuario.dart';
import 'package:movil_modular3/utils/config.dart';

class ProjectController {
  Future<bool> crearProyecto(
      String nombre, String modulo, List<String> correos) async {
    final response = await http.post(
        Uri.parse('${Config.ipServerApiUrl}/projects'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        },
        body: jsonEncode(
            {"nombre": nombre, "modulo": modulo, "correos": correos}));
    print(
        ">> [crearProyecto] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode != 200) return false;
    return true;
  }

  Future<List<Project>> obtenerProyectosPorUsuarioId() async {
    final response = await http
        .get(Uri.parse('${Config.ipServerApiUrl}/projects'), headers: {
      'Content-Type': 'application/json',
      "Cookie": Session().cookie
    });
    print(
        ">> [obtenerProyectosPorUsuarioId] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      var registros = <Project>[];

      for (var datos in jsonResponse) {
        registros.add(Project.fromJson(datos));
      }
      return registros;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  Future<Project> obtenerProyectoPorId(String id) async {
    final response = await http.post(
        Uri.parse('${Config.ipServerApiUrl}/obtenerProyectoPorId'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        },
        body: jsonEncode({"id": id}));
    print(
        ">> [obtenerProyectoPorId] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return Project.fromJson(jsonResponse);
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
    print(
        ">> [obtenerAlumnos] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

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
    print(
        ">> [obtenerDocentes] El servidor respondió con un código: ${response.statusCode}");
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

  Future<List<User>> obtenerIntegrantesProyecto(String proyectoId) async {
    final response = await http.post(
        Uri.parse('${Config.ipServerApiUrl}/obtenerIntegrantes'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        },
        body: jsonEncode({'proyectoId': proyectoId}));
    print(
        ">> [obtenerIntegrantesProyecto] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<User> registros = [];

      for (var datos in jsonResponse) {
        registros.add(User.fromJson(datos));
      }
      return registros;
    } else {
      throw Exception('Failed to load Integrantes');
    }
  }
}
