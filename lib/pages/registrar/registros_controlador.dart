import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/utils/config.dart';

class registerController {
  Future<bool> registrarAlumno(
      String nombre, String correo, String contrasena, String matricula) async {
    final response =
        await http.post(Uri.parse('${Config.ipServerApiUrl}/alumnos'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              "nombre": nombre,
              "correo": correo,
              "contrasena": contrasena,
              "matricula": matricula
            }));
    print(response.statusCode);
    if (response.statusCode != 200) return false;
    return true;
  }

  Future<bool> registrarDocente(
      String nombre, String correo, String contrasena) async {
    final response = await http.post(
        Uri.parse('${Config.ipServerApiUrl}/docentes'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {"nombre": nombre, "correo": correo, "contrasena": contrasena}));
    print(response.statusCode);
    if (response.statusCode != 200) return false;
    return true;
  }
}
