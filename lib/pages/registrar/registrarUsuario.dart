import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/login/login_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarAlumno_vista.dart';
import 'package:movil_modular3/pages/registrar/registrarDocente_vista.dart';

class RegisterUserPage extends StatelessWidget {
  static const String route = "/registeruser";
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      shadowColor:const Color.fromARGB(255, 51, 51, 51), 
      backgroundColor: const Color.fromARGB(255, 51, 51, 51), 
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.route, (route) => false);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))),
      backgroundColor: const Color.fromARGB(255, 51, 51, 51),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 40),
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Selecciona tu rol:", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  const SizedBox(height: 45),
                  SizedBox(
                    width: 300,
                    height: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RegisterStudentPage.route, (route) => false,);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 68, 117, 223),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.backpack_rounded, size: 95),
                              Text("Alumno"),
                            ],
                          ),
                        )),
                  ),
                  //
                  const SizedBox(height: 45),
                  //
                  SizedBox(
                    width: 300,
                    height: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RegisterTeacherPage.route, (route) => false,);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 170, 96, 219),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.book_rounded, size: 95),
                              Text("Docente"),
                            ],
                          ),
                        )),
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
