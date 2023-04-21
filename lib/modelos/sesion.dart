class Session {
  static Session? _session;

  String cookie = '';
  String userId = '';
  Session._();
  factory Session() {
    return _session ??= Session._();
  }
}
