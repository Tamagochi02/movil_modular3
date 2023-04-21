class Project {
  late String id;
  late String nombre;
  late String estado;
  late String modulo;
  late String evaluacion;
  late String creadoEn;
  late String actualizadoEn;

  Project(
      {required this.id,
      required this.nombre,
      required this.estado,
      required this.modulo,
      required this.evaluacion,
      required this.creadoEn,
      required this.actualizadoEn});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    estado = json['estado'];
    modulo = json['modulo'];
    evaluacion = json['evaluacion'];
    creadoEn = json['creadoEn'];
    actualizadoEn = json['actualizadoEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['estado'] = this.estado;
    data['modulo'] = this.modulo;
    data['evaluacion'] = this.evaluacion;
    data['creadoEn'] = this.creadoEn;
    data['actualizadoEn'] = this.actualizadoEn;
    return data;
  }
}
