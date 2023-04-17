import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/models/sesion.dart';

class LoginController {
  Future<bool> loginStudent(String email, String pswd) async {
    final response = await http.post(
      Uri.parse('https://modular2.vercel.app/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'correo': email, 'contrasena': pswd}),
    );
    if (response.statusCode != 200) return false;
    final cookie = response
        .headers['set-cookie']; // Variable donde guarda la cookie de sesion
    if (cookie == null) return false; // Si no encuentra cookie retorna false
    final pivote =
        cookie.indexOf(";"); // Busca dentro de la cookie el caracter ";"
    Session().cookie = pivote == -1 ? cookie : cookie.substring(0, pivote);
    // logoutStudent();
    return true;
  }

  logoutStudent() async {
    final response = await http.get(
      Uri.parse('https://modular2.vercel.app/api/logout'),
      headers: {'Content-Type': 'application/json', 'cookie': Session().cookie},
    );
    print(response.statusCode);
  }
}
