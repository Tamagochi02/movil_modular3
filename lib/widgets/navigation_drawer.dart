import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/controladores/sesion_controlador.dart';
import 'package:movil_modular3/pages/login/login_vista.dart';
import 'package:movil_modular3/pages/home.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SessionController();
    return Drawer(
        width: 240,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    Session().rol,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Session().rol == "Alumno"
                        ? Icons.backpack
                        : Icons.book_outlined,
                    size: 30.0,
                  )
                ],
              ),
              const SizedBox(height: 40),
              Text(Session().nombre,
                  style: const TextStyle(color: Colors.black)),
              //
              const SizedBox(height: 10),
              //
              const Divider(),
              //
              TextButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, HomePage.route, (route) => false),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 51, 51, 51),
                        size: 25.0,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Inicio",
                        style:
                            TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                      )
                    ],
                  )),
              //
              const Divider(),
              //
              TextButton(
                  onPressed: () {
                    const snackBar_logoutExitoso = SnackBar(
                      content: Text('Has cerrado sesión'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 1),
                    );
                    const snackBar_logoutFallido = SnackBar(
                      content: Text('Algo salió mal, no has cerrado sesión'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    );
                    controller.logout().then((value) {
                      if (!value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar_logoutFallido);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar_logoutExitoso);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      }
                    });
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Color.fromARGB(255, 51, 51, 51),
                        size: 25.0,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Cerrar sesion",
                        style:
                            TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                      )
                    ],
                  )),
              //
            ],
          ),
        ));
  }
}
