import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/login/login_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarAlumno.dart';
import 'package:movil_modular3/pages/registrar/registrarDocente.dart';

class RegisterUserPage extends StatelessWidget {
  static const String route = "/registeruser";
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 51, 51),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 40),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.route, (route) => false);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 240, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterStudentPage.route);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 68, 117, 223),
                        ),
                        child: const Text("Alumno")),
                  ),
                  //
                  const SizedBox(height: 45),
                  //
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterTeacherPage.route);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 170, 96, 219),
                        ),
                        child: const Text("Docente")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
