import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/alumno/documentos/crearDocumento_vista.dart';
import 'package:movil_modular3/pages/alumno/proyecto/crearProyecto_vista.dart';
import 'package:movil_modular3/pages/alumno/proyecto/infoProyecto_vista.dart';
import 'package:movil_modular3/pages/login/login_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarAlumno_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarDocente_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarUsuario.dart';
import 'package:movil_modular3/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // Lista de rutas
        LoginPage.route: (context) => const LoginPage(),
        RegisterStudentPage.route: (context) => const RegisterStudentPage(),
        RegisterTeacherPage.route: (context) => const RegisterTeacherPage(),
        RegisterUserPage.route: (context) => const RegisterUserPage(),
        HomePage.route: (context) => const HomePage(),
        CreateProjectPage.route: (context) => const CreateProjectPage(),
        InfoProjectPage.route: (context) => const InfoProjectPage(),
        CreateDocumentPage.route: (context) => const CreateDocumentPage(),
      },
      initialRoute:
          LoginPage.route, // Ruta que se mostrará al inicio de la ejecución
    );
  }
}
