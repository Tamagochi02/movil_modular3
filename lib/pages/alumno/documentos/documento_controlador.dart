import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/modelos/documento.dart';
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/utils/config.dart';

class DocumentController {
  Future<String> crearDocumento(
      String nombre, String titulo, String etapa, String proyectoid) async {
    String documentoId = "";
    final response = await http.post(
        Uri.parse('${Config.ipServerApiUrl}/projects/$proyectoid/documents'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        },
        body: jsonEncode({"nombre": nombre, "titulo": titulo, "etapa": etapa}));
    print(
        ">> [crearDocumento] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode != 200) {
      throw Exception('Failed to create document');
    } else {
      final jsonResponse = json.decode(response.body);
      final doc = Document.fromJson(jsonResponse);
      documentoId = doc.id!;
      return documentoId;
    }
  }

  Future<bool> crearEtapa3(String url, String documentoId) async {
    final response = await http.post(
        Uri.parse('${Config.ipServerApiUrl}/documents/$documentoId/etapa3'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        },
        body: jsonEncode({"url": url}));
    print(
        ">> [CrearEtapa3] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<Document>> obtenerDocumentosPorProyectoId(
      String proyectoid) async {
    final response = await http.get(
        Uri.parse('${Config.ipServerApiUrl}/projects/$proyectoid/documents'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        });
    print(
        ">> [obtenerDocumentosPorProyectoId] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      var registros = <Document>[];

      for (var datos in jsonResponse) {
        registros.add(Document.fromJson(datos));
      }
      return registros;
    } else {
      throw Exception('Error al cargar documentos');
    }
  }
}
