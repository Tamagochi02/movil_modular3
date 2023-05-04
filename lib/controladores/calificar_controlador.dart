import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/utils/config.dart';

class EvaluationController {
  Future<bool> evaluar(
      String estado, String evaluacion, String proyectoId) async {
    final response = await http.post(
        Uri.parse('${Config.ipServerApiUrl}/evaluarProyecto'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        },
        body: jsonEncode(
            {"estado": estado, "evaluacion": evaluacion, "id": proyectoId}));
    print(
        ">> [evaluar] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode != 200) return false;
    return true;
  }

  Future<bool> crearObservacion(String observacion, String documentoId) async {
    final response = await http.post(
        Uri.parse(
            '${Config.ipServerApiUrl}/documents/$documentoId/observaciones'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        },
        body: jsonEncode({"observacion": observacion}));
    print(
        ">> [crearObservacion] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode != 200) return false;
    return true;
  }
}
