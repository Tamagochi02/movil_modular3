import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:movil_modular3/pages/proyecto/crearProyecto_vista.dart';
import 'package:movil_modular3/controladores/proyecto_controlador.dart';
import 'package:movil_modular3/widgets/proyecto_card.dart';
import 'package:movil_modular3/widgets/navigation_drawer.dart' as widgets;
import 'package:movil_modular3/modelos/sesion.dart';

class HomePage extends StatefulWidget {
  static const String route = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ProjectController();
  List<Project> proyectos = [];
  bool estaCargando = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.obtenerProyectosPorUsuarioId().then((proyectos) => setState(() {
          this.proyectos = proyectos;
          estaCargando = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Proyectos", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(215, 255, 255, 255),
      drawer: const widgets.NavigationDrawer(),
      body: Stack(
        children: [
          if (proyectos.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: ListView.builder(
                itemCount: proyectos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ProjectCard(
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
          if (estaCargando)
            Container(
              color: const Color.fromARGB(215, 255, 255, 255),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
      floatingActionButton: Session().rol == "Alumno"
          ? FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 51, 51, 51),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, CreateProjectPage.route, (route) => false);
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
