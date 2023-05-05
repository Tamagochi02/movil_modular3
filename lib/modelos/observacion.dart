class Observation {
  String? id;
  String? observacion;
  String? creadoEn;
  String? actualizadoEn;

  Observation({this.id, this.observacion, this.creadoEn, this.actualizadoEn});

  Observation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    observacion = json['observacion'];
    creadoEn = json['creadoEn'];
    actualizadoEn = json['actualizadoEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['observacion'] = observacion;
    data['creadoEn'] = creadoEn;
    data['actualizadoEn'] = actualizadoEn;
    return data;
  }
}
