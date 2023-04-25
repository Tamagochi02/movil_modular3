import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:movil_modular3/controladores/proyecto_controlador.dart';
import 'package:movil_modular3/widgets/proyectoDocente_card.dart';
import 'package:movil_modular3/widgets/navigation_drawer.dart' as widgets;

class TeacherHomePage extends StatefulWidget {
  static const String route = "/homeTeacher";
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
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
        title: const Text("Proyectos"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 52, 105, 221),
      ),
      backgroundColor: const Color.fromARGB(215, 255, 255, 255),
      drawer: const widgets.NavigationDrawer(),
      body: Stack(
        children: [
          if (proyectos.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: proyectos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ProjectTeacherCard(
                          nombreProyecto: proyectos[index].nombre,
                          modulo: proyectos[index].modulo,
                          estado: proyectos[index].estado,
                          evaluacion: proyectos[index].evaluacion),
                      const SizedBox(height: 10)
                    ],
                  );
                },
              ),
            ),
          if (estaCargando)
            Container(
              color: Colors.white.withOpacity(0.8),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
