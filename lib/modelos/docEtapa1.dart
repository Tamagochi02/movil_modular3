class DocStage1 {
  late String id;
  String? resumen;
  String? palabrasClave;
  String? introduccion;
  String? desarrollo;
  String? conclusion;
  String? referencias;

  DocStage1(
      {required this.id,
      this.resumen,
      this.palabrasClave,
      this.introduccion,
      this.desarrollo,
      this.conclusion,
      this.referencias});

  DocStage1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resumen = json['resumen'];
    palabrasClave = json['palabrasClave'];
    introduccion = json['introduccion'];
    desarrollo = json['desarrollo'];
    conclusion = json['conclusion'];
    referencias = json['referencias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['resumen'] = this.resumen;
    data['palabrasClave'] = this.palabrasClave;
    data['introduccion'] = this.introduccion;
    data['desarrollo'] = this.desarrollo;
    data['conclusion'] = this.conclusion;
    data['referencias'] = this.referencias;
    return data;
  }
}
