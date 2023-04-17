class RouteParamsStudentPage {
  static String? matricula = '';
  static String? nombre = '';

  RouteParamsStudentPage._();

  static assign(String? nombre, String? matricula) {
    RouteParamsStudentPage.nombre = nombre;
    RouteParamsStudentPage.matricula = matricula;
  }
}