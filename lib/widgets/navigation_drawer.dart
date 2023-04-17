import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/login/login_vista.dart';
import 'package:movil_modular3/pages/alumno/home.dart';

class NavigationDrawer extends StatelessWidget {
  //final controller = LoginController();
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 25),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: const [
              Text(
                "Alumno",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.account_box_outlined,
                size: 30.0,
              )
            ],
          ),
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
                    style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                  )
                ],
              )),
          //
          const Divider(),
          //
          const Text(
            "Equipo",
            style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
          ),
          //
          Row(
            children: const [
              Icon(
                Icons.boy,
                size: 28.0,
              ),
              Text(
                "Integrante 1",
                // textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.boy,
                size: 28.0,
              ),
              Text(
                "Integrante 2",
                // textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.boy,
                size: 28.0,
              ),
              Text(
                "Integrante 3",
                // textAlign: TextAlign.left,
              ),
            ],
          ),
          //
          const Divider(),
          //
          TextButton(
              onPressed: () {
                //controller.logoutStudent();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.route, (route) => false);
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
                    style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                  )
                ],
              )),
          //
        ],
      ),
    ));
  }
}
