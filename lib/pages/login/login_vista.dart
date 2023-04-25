import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/pages/alumno/homeAlumno_vista.dart';
import 'package:movil_modular3/pages/docente/homeDocente_vista.dart';
import 'package:movil_modular3/controladores/login_controlador.dart';
import 'package:movil_modular3/pages/registrar/registrarUsuario.dart';

class LoginPage extends StatefulWidget {
  static const String route = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final textCorreoController = TextEditingController();
  final textContrasenaController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 51, 51), // Color de fondo
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("GESTOR MODULAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                )),
            const SizedBox(height: 100),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: textCorreoController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                label: Text(
                  "Correo institucional",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                suffixIcon: Icon(Icons.mail_outline, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 45),
            TextField(
              enableInteractiveSelection: false,
              obscureText: true,
              controller: textContrasenaController,
              decoration: const InputDecoration(
                label: Text(
                  "Contraseña",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                suffixIcon: Icon(Icons.lock_outline, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 45),
            SizedBox(
              width: 240,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // ignore: constant_identifier_names
                  const snackBar_camposVacios = SnackBar(
                    content: Text('Debes llenar todos los campos'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 1),
                  );
                  const snackBar_usuarioNoEncontrado = SnackBar(
                    content: Text('No se encontró el usuario'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 1),
                  );
                  if (textCorreoController.text.isEmpty ||
                      textContrasenaController.text.isEmpty) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar_camposVacios);
                    return;
                  }
                  controller
                      .login(textCorreoController.text.trim(),
                          textContrasenaController.text.trim())
                      .then((value) {
                    if (value) {
                      if(Session().rol=='Alumno') {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentHomePage(),
                          ),
                        ); */
                        Navigator.pushNamedAndRemoveUntil(
                          context, StudentHomePage.route, (route) => false);
                      } else if (Session().rol=='Docente') {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeacherHomePage(),
                          ),
                        ); */
                        Navigator.pushNamedAndRemoveUntil(
                          context, TeacherHomePage.route, (route) => false);
                      }
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar_usuarioNoEncontrado);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                child: const Text("Ingresar",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("¿Eres nuevo?",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                ElevatedButton(
                  onPressed: () {
                    /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterUserPage(),
                          ),
                        ); */
                    Navigator.pushNamed(
                        context, RegisterUserPage.route);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      shadowColor: Colors.transparent,
                      backgroundColor: const Color.fromARGB(255, 51, 51, 51)),
                  child: const Text("Crea una cuenta",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
