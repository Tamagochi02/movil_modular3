import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/usuario.dart';
import 'package:movil_modular3/pages/alumno/proyecto/proyecto_controlador.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CreateProjectPage extends StatefulWidget {
  static const String route = "/createproject";
  const CreateProjectPage({Key? key}) : super(key: key);

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final textNombreController = TextEditingController();
  final textModuloController = TextEditingController();
  final controller = ProjectController();
  bool showDropdownStudents = false;
  bool showDropdownTeachers = false;
  List<User> alumnos = [];
  List<String> correoAlumnosSeleccionados = [];
  List<User> docentes = [];
  List<String> correoDocentesSeleccionados = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller
        .obtenerAlumnos()
        .then((alumnos) => setState(() => this.alumnos = alumnos));

    controller
        .obtenerDocentes()
        .then((docentes) => setState(() => this.docentes = docentes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Crear Proyecto",
            style: TextStyle(color: Color.fromARGB(255, 51, 51, 51))),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Color.fromARGB(255, 51, 51, 51),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: ListView(children: [
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textNombreController,
            decoration: const InputDecoration(
              label: Text("Nombre del proyecto:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          //
          const SizedBox(height: 20),
          //
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textModuloController,
            decoration: const InputDecoration(
              label: Text("Módulo:"),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(height: 40),

          InkWell(
            onTap: () {
              setState(() {
                showDropdownStudents = !showDropdownStudents;
              });
            },
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("Integrantes del equipo"),
            ),
          ),
          if (showDropdownStudents)
            Column(
                children: alumnos
                    .map((alumno) => Row(
                          children: [
                            Checkbox(
                              value: correoAlumnosSeleccionados
                                  .firstWhere(
                                      (correo) =>
                                          (alumno.correo ?? '') == correo,
                                      orElse: () => '')
                                  .isNotEmpty,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null && newValue) {
                                    correoAlumnosSeleccionados
                                        .add(alumno.correo ?? '');
                                  } else {
                                    correoAlumnosSeleccionados
                                        .remove(alumno.correo ?? '');
                                  }
                                });
                              },
                            ),
                            Text(alumno.nombre ?? '')
                          ],
                        ))
                    .toList()),

          const SizedBox(height: 40),

          InkWell(
            onTap: () {
              setState(() {
                showDropdownTeachers = !showDropdownTeachers;
              });
            },
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("Asesor"),
            ),
          ),
          if (showDropdownTeachers)
            Column(
                children: docentes
                    .map((docente) => Row(
                          children: [
                            Checkbox(
                              value: correoDocentesSeleccionados
                                  .firstWhere(
                                      (correo) =>
                                          (docente.correo ?? '') == correo,
                                      orElse: () => '')
                                  .isNotEmpty,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null && newValue) {
                                    correoDocentesSeleccionados
                                        .add(docente.correo ?? '');
                                  } else {
                                    correoDocentesSeleccionados
                                        .remove(docente.correo ?? '');
                                  }
                                });
                              },
                            ),
                            Text(docente.nombre ?? '')
                          ],
                        ))
                    .toList()),

          const SizedBox(height: 40),

          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                const snackBar_camposVacios = SnackBar(
                  content: Text('Debes llenar todos los campos'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                );

                if (textNombreController.text.isEmpty ||
                    textModuloController.text.isEmpty ||
                    correoDocentesSeleccionados.length == 0 ||
                    correoAlumnosSeleccionados.length == 0) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar_camposVacios);
                } else {
                  print(correoAlumnosSeleccionados);
                  /* controller.crearProyecto(textNombreController.text.trim(),
                      textModuloController.text.trim(), correos); */
                }
              },
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
