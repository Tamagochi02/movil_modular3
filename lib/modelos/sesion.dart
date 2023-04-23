class Session {
  static Session? _session;

  String cookie = '';
  String userId = '';
  String rol = '';
  String nombre = '';
  Session._();
  factory Session() {
    return _session ??= Session._();
  }
}
