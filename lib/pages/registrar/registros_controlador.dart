import 'dart:convert';
import 'package:http/http.dart' as http;

class registerController {
  Future<bool> registrarAlumno(
      String nombre, String correo, String contrasena, String matricula) async {
    final response =
        await http.post(Uri.parse('http://localhost:3000/api/alumnos'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              "nombre": nombre,
              "correo": correo,
              "contrasena": contrasena,
              "matricula": matricula
            }));
    if (response.statusCode != 200) return false;
    return true;
  }

   Future<bool> registrarDocente(
      String nombre, String correo, String contrasena) async {
    final response =
        await http.post(Uri.parse('http://localhost:3000/api/docentes'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              "nombre": nombre,
              "correo": correo,
              "contrasena": contrasena
            }));
    if (response.statusCode != 200) return false;
    return true;
  }
}
