import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movil_modular3/modelos/archivo2.dart';
import 'package:movil_modular3/modelos/documento.dart';
import 'package:movil_modular3/modelos/docEtapa3.dart';
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
      documentoId = doc.id;
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

  Future<bool> actualizarEtapa3(String url, String etapaId) async {
    final response = await http.post(
        Uri.parse('${Config.ipServerApiUrl}/actualizarEtapa3'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        },
        body: jsonEncode({"url": url, "id": etapaId}));   
    print(
        ">> [actualizarEtapa3] El servidor respondió con un código: ${response.statusCode}");

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

  Future<Document> obtenerDocumentoPorId(String documentoId) async {
    final response = await http.get(
        Uri.parse('${Config.ipServerApiUrl}/documents/$documentoId'),
        headers: {
          'Content-Type': 'application/json',
          "Cookie": Session().cookie
        });
    print(
        ">> [obtenerDocumentoPorId] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      Document documento;
      documento = Document.fromJson(jsonResponse);
      return documento;
    } else {
      throw Exception('Error al cargar el documento');
    }
  }

  Future<Filee2> subirArchivo(
      String ext, String b64, String description, String user) async {
    final response = await http.post(
      Uri.parse('https://web-production-77aa.up.railway.app/posts/$user'),
      headers: {'Content-Type': 'application/json', "Cookie": Session().cookie},
      body: jsonEncode({
        "media": {'ext': ext, 'b64': b64},
        'description': description,
      }),
    );
    print(
        ">> [subirArchivo] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      Filee2 archivo;
      archivo = Filee2.fromJson(jsonResponse);
      return archivo;
    } else {
      throw Exception("Error al subir el archivo");
    }
  }

  Future<dynamic> obtenerArchivo(String urlMedia) async {
    final response = await http.get(
        Uri.parse(
            'https://web-production-77aa.up.railway.app/assets/$urlMedia'),
        headers: {'Content-Type': 'application/json'});
    print(
        ">> [obtenerArchivo] El servidor respondió con un código: ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Error al cargar el documento');
    }
  }
}
