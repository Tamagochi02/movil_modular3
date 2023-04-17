import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/registrar/registrarUsuario.dart';

class LoginPage extends StatefulWidget {
  static const String route = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginCorreoController = TextEditingController();
  final loginPassController = TextEditingController();
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
            //
            const SizedBox(height: 100),
            //
            TextField(
              controller: loginCorreoController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                label: Text(
                  "Correo institucional:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            //
            const SizedBox(height: 45),
            //
            TextField(
              controller: loginPassController,
              decoration: const InputDecoration(
                label: Text(
                  "Contraseña:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            //
            const SizedBox(height: 45),
            //
            SizedBox(
              width: 120,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                child: const Text("Ingresar",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              ),
            ),

            //
            SizedBox(height: 45),
            //
            const Divider(
              color: Colors.white,
            ),
            //
            const SizedBox(height: 45),
            //
            SizedBox(
              width: 170,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RegisterUserPage.route, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text("Crear una cuenta",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
