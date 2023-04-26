class Filee2 {
  String? description;
  String? id;
  late String media;
  String? user;

  Filee2({this.description, this.id, required this.media, this.user});

  Filee2.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    media = json['media'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['media'] = this.media;
    data['user'] = this.user;
    return data;
  }
}