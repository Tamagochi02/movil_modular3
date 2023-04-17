class Session {
  static Session? _session;

  String cookie = '';
  Session._();
  factory Session() {
    return _session ??= Session._();
  }
}
