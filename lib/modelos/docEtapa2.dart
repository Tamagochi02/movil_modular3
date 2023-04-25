class DocStage2 {
  late String id;
  String? descripcion;
  String? objGeneral;
  String? objsMetas;
  String? alcance;
  String? herramientas;

  DocStage2(
      {required this.id,
      this.descripcion,
      this.objGeneral,
      this.objsMetas,
      this.alcance,
      this.herramientas});

  DocStage2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descripcion = json['descripcion'];
    objGeneral = json['objGeneral'];
    objsMetas = json['objsMetas'];
    alcance = json['alcance'];
    herramientas = json['herramientas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descripcion'] = this.descripcion;
    data['objGeneral'] = this.objGeneral;
    data['objsMetas'] = this.objsMetas;
    data['alcance'] = this.alcance;
    data['herramientas'] = this.herramientas;
    return data;
  }
}
