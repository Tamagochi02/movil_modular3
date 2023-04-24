class Document {
  late String id;
  late String nombre;
  late String titulo;
  late String etapa;
  late String creadoEn;
  late String actualizadoEn;

  Document(
      {required this.id,
      required this.nombre,
      required this.titulo,
      required this.etapa,
      required this.creadoEn,
      required this.actualizadoEn});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    titulo = json['titulo'];
    etapa = json['etapa'];
    creadoEn = json['creadoEn'];
    actualizadoEn = json['actualizadoEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['titulo'] = this.titulo;
    data['etapa'] = this.etapa;
    data['creadoEn'] = this.creadoEn;
    data['actualizadoEn'] = this.actualizadoEn;
    return data;
  }
}
