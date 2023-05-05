
import 'package:movil_modular3/modelos/observacion.dart';
import 'dart:convert';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/utils/config.dart';

class ObservationController {
  Future<List<Observation>> obtenerObservacionesPorDocumentoId(String documentoId) async {
    final response = await http
        .get(Uri.parse('${Config.ipServerApiUrl}/documents/$documentoId/observaciones'), headers: {
      'Content-Type': 'application/json',
      "Cookie": Session().cookie
    });
    print(
        ">> [obtenerObservacionesPorDocumentoId] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      var registros = <Observation>[];

      for (var datos in jsonResponse) {
        registros.add(Observation.fromJson(datos));
      }
      return registros;
    } else {
      throw Exception('Failed to load projects');
    }
  }
}