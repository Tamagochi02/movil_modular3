import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/utils/config.dart';

class LoginController {
  Future<bool> login(String correo, String contrasena) async {
    final response = await http.post(
      Uri.parse('${Config.ipServerApiUrl}/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'correo': correo, 'contrasena': contrasena}),
    );
    if (response.statusCode != 200) return false;
    final cookie = response
        .headers['set-cookie']; // Variable donde guarda la cookie de sesion
    if (cookie == null) return false; // Si no encuentra cookie retorna false
    final pivote =
        cookie.indexOf(";"); // Busca dentro de la cookie el caracter ";"
    Session().cookie = pivote == -1 ? cookie : cookie.substring(0, pivote);
    return true;
  }

  logout() async {
    final response = await http.get(
      Uri.parse('${Config.ipServerApiUrl}/logout'),
      headers: {'Content-Type': 'application/json', 'cookie': Session().cookie},
    );
    print(response.statusCode);
  }
}
