import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:movil_modular3/pages/alumno/proyecto/crearProyecto_vista.dart';
import 'package:movil_modular3/pages/alumno/proyecto/proyecto_controlador.dart';
import 'package:movil_modular3/widgets/proyectoAlumno_card.dart';
import 'package:movil_modular3/widgets/navigation_drawer.dart' as widgets;

class StudentHomePage extends StatefulWidget {
  static const String route = "/homeStudent";
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final controller = ProjectController();
  List<Project> proyectos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller
        .obtenerProyectosPorUsuarioId()
        .then((proyectos) => setState(() => this.proyectos = proyectos));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Proyectos", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(215, 255, 255, 255),
        drawer: const widgets.NavigationDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: ListView.builder(
            itemCount: proyectos.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProjectStudentCard(
                      nombreProyecto: proyectos[index].nombre,
                      modulo: proyectos[index].modulo,
                      estado: proyectos[index].estado,
                      evaluacion: proyectos[index].evaluacion,
                      id: proyectos[index].id),
                  const SizedBox(height: 10)
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, CreateProjectPage.route, (route) => false);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
