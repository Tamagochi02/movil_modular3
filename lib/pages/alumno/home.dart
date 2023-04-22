import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:movil_modular3/pages/alumno/proyecto/crearProyecto_vista.dart';
import 'package:movil_modular3/pages/alumno/proyecto/proyecto_controlador.dart';
import 'package:movil_modular3/widgets/proyecto_card.dart';

class HomePage extends StatefulWidget {
  static const String route = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          title: const Text("Proyectos"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 52, 105, 221),
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications)),
        ),
        //
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: ListView.builder(
            itemCount: proyectos.length,
            itemBuilder: (context, index) {
              return ProjectCard(
                  nombreProyecto: proyectos[index].nombre,
                  modulo: proyectos[index].modulo,
                  estado: proyectos[index].estado,
                  evaluacion: proyectos[index].evaluacion);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateProjectPage.route);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
