import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/login/login_vista.dart';
import 'package:movil_modular3/pages/registrar/registros_controlador.dart';
import 'package:movil_modular3/pages/registrar/registrarUsuario.dart';

class RegisterStudentPage extends StatefulWidget {
  static const String route = "/registerstudent";
  const RegisterStudentPage({Key? key}) : super(key: key);

  @override
  State<RegisterStudentPage> createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState extends State<RegisterStudentPage> {
  final controller = RegisterController();
  final textMatriculaController = TextEditingController();
  final textCorreoController = TextEditingController();
  final textNombreController = TextEditingController();
  final textApellido1Controller = TextEditingController();
  final textApellido2Controller = TextEditingController();
  final textContrasena1Controller = TextEditingController();
  final textContrasena2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Registro de Alumno",
          style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Color.fromARGB(255, 51, 51, 51),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: ListView(children: [
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textMatriculaController,
            decoration: const InputDecoration(
              label: Text("Matrícula:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          //
          const SizedBox(height: 20),
          //
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textCorreoController,
            decoration: const InputDecoration(
              label: Text("Correo institucional:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          //
          const SizedBox(height: 20),
          //
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textNombreController,
            decoration: const InputDecoration(
              label: Text("Nombre:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          //
          const SizedBox(height: 20),
          //
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textApellido1Controller,
            decoration: const InputDecoration(
              label: Text("Apellido paterno:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          //
          const SizedBox(height: 20),
          //
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textApellido2Controller,
            decoration: const InputDecoration(
              label: Text("Apellido materno:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          //
          const SizedBox(height: 20),
          //
          TextField(
            enableInteractiveSelection: false,
            obscureText: true,
            controller: textContrasena1Controller,
            decoration: const InputDecoration(
              label: Text("Contraseña:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          //
          const SizedBox(height: 20),
          //
          TextField(
            enableInteractiveSelection: false,
            obscureText: true,
            controller: textContrasena2Controller,
            decoration: const InputDecoration(
              label: Text("Vuelve a escribir la contraseña:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          //
          const SizedBox(height: 50),
          //
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // ignore: constant_identifier_names
                const snackBar_camposVacios = SnackBar(
                  content: Text('Debes llenar todos los campos'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                );
                const snackBar_contrasenasDiferentes = SnackBar(
                  content: Text('Ambas contraseñas deben coincidir'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                );
                const snackBar_registroExitoso = SnackBar(
                  content: Text('Te has registrado con éxito'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 1),
                );
                const snackBar_registroFallido = SnackBar(
                  content: Text('Algo salió mal, no has sido registrado'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                );
                if (textMatriculaController.text.isEmpty ||
                    textCorreoController.text.isEmpty ||
                    textNombreController.text.isEmpty ||
                    textApellido1Controller.text.isEmpty ||
                    textApellido2Controller.text.isEmpty ||
                    textContrasena1Controller.text.isEmpty ||
                    textContrasena2Controller.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar_camposVacios);
                } else if (textContrasena1Controller.text !=
                    textContrasena2Controller.text) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar_contrasenasDiferentes);
                } else {
                  String nom =
                      "${textNombreController.text.trim()} ${textApellido1Controller.text.trim()} ${textApellido2Controller.text.trim()}";
                  controller
                      .registrarAlumno(
                          nom,
                          textCorreoController.text.trim(),
                          textContrasena2Controller.text.trim(),
                          textMatriculaController.text.trim())
                      .then((value) {
                    if (!value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar_registroFallido);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar_registroExitoso);
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.route, (route) => false);
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 51, 51, 51),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text("Registrarme"),
            ),
          )
        ]),
      ),
    );
  }
}
