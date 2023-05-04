import 'package:movil_modular3/modelos/docEtapa1.dart';
import 'package:movil_modular3/modelos/docEtapa2.dart';
import 'package:movil_modular3/modelos/docEtapa3.dart';

class Document {
  late String id;
  late String nombre;
  late String titulo;
  late String etapa;
  late String creadoEn;
  late String actualizadoEn;
  late String proyectoId;
  late List<DocStage1> docEtapa1;
  late List<DocStage2> docEtapa2;
  late List<DocStage3> docEtapa3;

  Document(
      {required this.id,
      required this.nombre,
      required this.titulo,
      required this.etapa,
      required this.creadoEn,
      required this.actualizadoEn,
      required this.proyectoId,
      required this.docEtapa1,
      required this.docEtapa2,
      required this.docEtapa3});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    titulo = json['titulo'];
    etapa = json['etapa'];
    creadoEn = json['creadoEn'];
    actualizadoEn = json['actualizadoEn'];
    proyectoId = json['proyectoId'];
    if (json['DocEtapa1'] != null) {
      docEtapa1 = <DocStage1>[];
      json['DocEtapa1'].forEach((v) {
        docEtapa1.add(new DocStage1.fromJson(v));
      });
    }
    if (json['DocEtapa2'] != null) {
      docEtapa2 = <DocStage2>[];
      json['DocEtapa2'].forEach((v) {
        docEtapa2.add(new DocStage2.fromJson(v));
      });
    }
    if (json['DocEtapa3'] != null) {
      docEtapa3 = <DocStage3>[];
      json['DocEtapa3'].forEach((v) {
        docEtapa3.add(new DocStage3.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nombre'] = nombre;
    data['titulo'] = titulo;
    data['etapa'] = etapa;
    data['creadoEn'] = creadoEn;
    data['actualizadoEn'] = actualizadoEn;
    data['proyectoId'] = proyectoId;
    if (docEtapa1 != null) {
      data['DocEtapa1'] = docEtapa1.map((v) => v.toJson()).toList();
    }
    if (docEtapa2 != null) {
      data['DocEtapa2'] = docEtapa2.map((v) => v.toJson()).toList();
    }
    if (docEtapa3 != null) {
      data['DocEtapa3'] = docEtapa3.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
