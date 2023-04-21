class User {
  String? id;
  String? nombre;
  String? correo;
  String? rol;
  bool? estaActivo;
  String? contrasena;
  String? creadoEn;
  String? actualizadoEn;
  Matricula? matricula;

  User(
      {this.id,
      this.nombre,
      this.correo,
      this.rol,
      this.estaActivo,
      this.contrasena,
      this.creadoEn,
      this.actualizadoEn,
      this.matricula});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    correo = json['correo'];
    rol = json['rol'];
    estaActivo = json['estaActivo'];
    contrasena = json['contrasena'];
    creadoEn = json['creadoEn'];
    actualizadoEn = json['actualizadoEn'];
    matricula = json['matricula'] != null
        ? new Matricula.fromJson(json['matricula'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['correo'] = this.correo;
    data['rol'] = this.rol;
    data['estaActivo'] = this.estaActivo;
    data['contrasena'] = this.contrasena;
    data['creadoEn'] = this.creadoEn;
    data['actualizadoEn'] = this.actualizadoEn;
    if (this.matricula != null) {
      data['matricula'] = this.matricula!.toJson();
    }
    return data;
  }
}

class Matricula {
  String? id;
  String? usuarioId;
  String? matricula;

  Matricula({this.id, this.usuarioId, this.matricula});

  Matricula.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuarioId = json['usuarioId'];
    matricula = json['matricula'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuarioId'] = this.usuarioId;
    data['matricula'] = this.matricula;
    return data;
  }
}
