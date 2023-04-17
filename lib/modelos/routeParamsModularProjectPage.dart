class RouteParamsModularProjectPage {
  static String projectId = '';
  static String title = '';

  RouteParamsModularProjectPage._();

  static assign(String title, String projectId) {
    RouteParamsModularProjectPage.title = title;
    RouteParamsModularProjectPage.projectId = projectId;
  }
}
