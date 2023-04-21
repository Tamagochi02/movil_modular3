import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/alumno/proyecto/crearProyecto_vista.dart';
import 'package:movil_modular3/pages/login/login_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarAlumno_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarDocente_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarUsuario.dart';
import 'package:movil_modular3/pages/alumno/docRegister.dart';
import 'package:movil_modular3/pages/alumno/docUpdateEtapa1y2.dart';
import 'package:movil_modular3/pages/alumno/docUpdateEtapa3.dart';
import 'package:movil_modular3/pages/alumno/home.dart';
import 'package:movil_modular3/pages/alumno/documents.dart';

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
        DocumentsPage.route: (context) => const DocumentsPage(),
        DocRegisterPage.route: (context) => const DocRegisterPage(),
        DocUpdate3Page.route: (context) => const DocUpdate3Page(),
        DocUpdate1and2Page.route: (context) => const DocUpdate1and2Page(),
        CreateProjectPage.route : (context) => const CreateProjectPage()
      },
      initialRoute:
          LoginPage.route, // Ruta que se mostrará al inicio de la ejecución
    );
  }
}
