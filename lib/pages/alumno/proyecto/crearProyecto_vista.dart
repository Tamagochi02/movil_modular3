import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/usuario.dart';
import 'package:movil_modular3/pages/alumno/homeAlumno_vista.dart';
import 'package:movil_modular3/pages/alumno/proyecto/proyecto_controlador.dart';

class CreateProjectPage extends StatefulWidget {
  static const String route = "/createproject";
  const CreateProjectPage({Key? key}) : super(key: key);

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final textNombreController = TextEditingController();
  final controller = ProjectController();
  bool showDropdownStudents = false;
  bool showDropdownTeachers = false;
  bool showDropdownModules = false;

  List<User> alumnos = [];
  List<String> correoAlumnosSeleccionados = [];
  List<User> docentes = [];
  List<String> correoDocentesSeleccionados = [];
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  String modulo = "";

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
              Navigator.pushNamedAndRemoveUntil(
                  context, StudentHomePage.route, (route) => false);
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
              label:
                  Text("Nombre del proyecto", style: TextStyle(fontSize: 19)),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              setState(() {
                showDropdownModules = !showDropdownModules;
              });
            },
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Módulo"),
            ),
          ),
          if (showDropdownModules)
            Column(children: [
              Row(
                children: [
                  Checkbox(
                    value: _checkbox1,
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          modulo = "Modulo_1";
                          _checkbox1 = true;
                        } else {
                          _checkbox1 = false;
                        }
                      });
                    },
                  ),
                  const Text('Módulo 1'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _checkbox2,
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          modulo = "Modulo_2";
                          _checkbox2 = true;
                        } else {
                          _checkbox2 = false;
                        }
                      });
                    },
                  ),
                  const Text('Módulo 2'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _checkbox3,
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          modulo = "Modulo_3";
                          _checkbox3 = true;
                        } else {
                          _checkbox3 = false;
                        }
                      });
                    },
                  ),
                  const Text('Módulo 3'),
                ],
              ),
            ]),
          const SizedBox(height: 20),
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
                borderRadius: BorderRadius.circular(10),
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
          const SizedBox(height: 20),
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
                borderRadius: BorderRadius.circular(10),
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
                const snackBar_registroExitoso = SnackBar(
                  content: Text('Se ha creado con éxito'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 1),
                );
                const snackBar_registroFallido = SnackBar(
                  content: Text('Algo salió mal, no ha sido creado'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                );

                if (textNombreController.text.isEmpty ||
                    modulo.isEmpty ||
                    correoDocentesSeleccionados.length == 0 ||
                    correoAlumnosSeleccionados.length == 0) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar_camposVacios);
                } else {
                  List<String> correoUsuariosSeleccionados = [];
                  correoUsuariosSeleccionados
                      .addAll(correoAlumnosSeleccionados);
                  correoUsuariosSeleccionados
                      .addAll(correoDocentesSeleccionados);
                  controller
                      .crearProyecto(textNombreController.text.trim(), modulo,
                          correoUsuariosSeleccionados)
                      .then((value) {
                    if (!value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar_registroFallido);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar_registroExitoso);
                      Navigator.pushNamedAndRemoveUntil(
                          context, StudentHomePage.route, (route) => false);
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 51, 51, 51),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
              ),
              child: const Text("Crear"),
            ),
          )
        ]),
      ),
    );
  }
}
