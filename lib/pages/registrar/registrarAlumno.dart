import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/registrar/registrarUsuario.dart';

class RegisterStudentPage extends StatefulWidget {
  static const String route = "/registerstudent";
  const RegisterStudentPage({Key? key}) : super(key: key);

  @override
  State<RegisterStudentPage> createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState extends State<RegisterStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Registro de Alumno", style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
                          context, RegisterUserPage.route, (route) => false);
        }, icon: const Icon(Icons.close, color: Color.fromARGB(255, 51, 51, 51),)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: ListView(children: [ 
          const TextField(
            decoration: InputDecoration(
              label: Text("Matrícula:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          // 
          const SizedBox(height: 20),
          // 
          const TextField(
            decoration: InputDecoration(
              label: Text("Correo institucional:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          // 
          const SizedBox(height: 20),
          // 
          const TextField(
            decoration: InputDecoration(
              label: Text("Nombre:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          // 
          const SizedBox(height: 20),
          // 
          const TextField(
            decoration: InputDecoration(
              label: Text("Apellido paterno:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          // 
          const SizedBox(height: 20),
          // 
          const TextField(
            decoration: InputDecoration(
              label: Text("Apellido materno:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          // 
          const SizedBox(height: 20),
          // 
          const TextField(
            decoration: InputDecoration(
              label: Text("Contraseña:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          // 
          const SizedBox(height: 20),
          // 
          const TextField(
            decoration: InputDecoration(
              label: Text("Vuelve a escribir contraseña:"),
            ),
          ),
          //
          const SizedBox(height: 50),
          //
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
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
