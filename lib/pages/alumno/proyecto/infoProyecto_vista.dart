import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/documento.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:movil_modular3/pages/alumno/documentos/crearDocumento_vista.dart';
import 'package:movil_modular3/controladores/documento_controlador.dart';
import 'package:movil_modular3/controladores/proyecto_controlador.dart';
import 'package:movil_modular3/pages/home.dart';
import 'package:movil_modular3/widgets/documentoAlumno_card.dart';
import 'package:movil_modular3/modelos/sesion.dart';

class InfoProjectPage extends StatefulWidget {
  final String id;
  static const String route = "/infoProject";
  const InfoProjectPage({Key? key, this.id = ""}) : super(key: key);

  @override
  State<InfoProjectPage> createState() => _InfoProjectPageState();
}

class _InfoProjectPageState extends State<InfoProjectPage> {
  final projectController = ProjectController();
  final documentController = DocumentController();
  final textObservacionesController = TextEditingController();
  List<Document> documentos = [];
  Project? proyecto;
  bool estaCargando = true;
  bool _checkboxStatus1 = false;
  bool _checkboxStatus2 = false;
  bool _checkboxEvaluation1 = false;
  bool _checkboxEvaluation2 = false;
  bool showDropdownStatus = false;
  bool showDropdownEvaluation = false;
  String estado = "";
  String evaluacion = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    projectController.obtenerProyectoPorId(widget.id).then((value) {
      setState(() {
        proyecto = value;
        estaCargando = false;
      });
    });

    documentController.obtenerDocumentosPorProyectoId(widget.id).then((value) {
      setState(() {
        documentos.addAll(value);
        estaCargando = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Detalles de Proyecto",
            style: TextStyle(color: Color.fromARGB(255, 51, 51, 51))),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomePage.route, (route) => false);
            },
            icon: const Icon(
              Icons.close,
              color: Color.fromARGB(255, 51, 51, 51),
            )),
      ),
      backgroundColor: const Color.fromARGB(215, 255, 255, 255),
      body: Stack(
        children: [
          if (proyecto != null)
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text("Información:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextField(
                            readOnly: true,
                            textCapitalization: TextCapitalization.sentences,
                            controller:
                                TextEditingController(text: proyecto!.nombre),
                            decoration: const InputDecoration(
                              label: Text("Nombre del proyecto",
                                  style: TextStyle(fontSize: 19)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            readOnly: true,
                            controller:
                                TextEditingController(text: proyecto!.modulo),
                            decoration: const InputDecoration(
                              label: Text("Módulo",
                                  style: TextStyle(fontSize: 19)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 100,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 215, 215, 215),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(proyecto!.estado)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 100,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 215, 215, 215),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(proyecto!.evaluacion)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Documentos:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  const SizedBox(height: 10),
                  if (documentos.isNotEmpty)
                    for (final documento in documentos)
                      DocumentCard(
                        nombre: documento.nombre,
                        titulo: documento.titulo,
                        etapa: documento.etapa,
                        id: documento.id,
                      ),
                  const SizedBox(height: 20),
                  if (Session().rol == "Docente")
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Evalua:",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showDropdownStatus = !showDropdownStatus;
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
                                    child: const Text("Estado"),
                                  ),
                                ),
                                if (showDropdownStatus)
                                  Column(children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _checkboxStatus1,
                                          onChanged: (value) {
                                            setState(() {
                                              if (value != null && value) {
                                                estado = "Debe_modificarse";
                                                _checkboxStatus1 = true;
                                              } else {
                                                _checkboxStatus1 = false;
                                              }
                                            });
                                          },
                                        ),
                                        const Text('Debe modificarse'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _checkboxStatus2,
                                          onChanged: (value) {
                                            setState(() {
                                              if (value != null && value) {
                                                estado = "Revisado";
                                                _checkboxStatus2 = true;
                                              } else {
                                                _checkboxStatus2 = false;
                                              }
                                            });
                                          },
                                        ),
                                        const Text('Revisado'),
                                      ],
                                    ),
                                  ]),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showDropdownEvaluation =
                                          !showDropdownEvaluation;
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
                                    child: const Text("Evaluación"),
                                  ),
                                ),
                                if (showDropdownEvaluation)
                                  Column(children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _checkboxEvaluation1,
                                          onChanged: (value) {
                                            setState(() {
                                              if (value != null && value) {
                                                evaluacion = "Acreditado";
                                                _checkboxEvaluation1 = true;
                                              } else {
                                                _checkboxEvaluation1 = false;
                                              }
                                            });
                                          },
                                        ),
                                        const Text('Acreditado'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _checkboxEvaluation2,
                                          onChanged: (value) {
                                            setState(() {
                                              if (value != null && value) {
                                                evaluacion = "No_acreditado";
                                                _checkboxEvaluation2 = true;
                                              } else {
                                                _checkboxEvaluation2 = false;
                                              }
                                            });
                                          },
                                        ),
                                        const Text('No acreditado'),
                                      ],
                                    ),
                                  ]),
                                const SizedBox(height: 15),
                                TextField(
                                  maxLines: null,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: textObservacionesController,
                                  decoration: const InputDecoration(
                                    label: Text("Observaciones",
                                        style: TextStyle(fontSize: 19)),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      const snackBar_camposVacios = SnackBar(
                                        content: Text(
                                            'Debes llenar todos los campos'),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 1),
                                      );
                                      const snackBar_registroExitoso = SnackBar(
                                        content:
                                            Text('Se ha evaluado con exito'),
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 1),
                                      );
                                      const snackBar_registroFallido = SnackBar(
                                        content: Text(
                                            'Algo salió mal, no se realizó la evaluación'),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 1),
                                      );

                                      if (textObservacionesController
                                              .text.isEmpty ||
                                          estado.isEmpty ||
                                          evaluacion.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                snackBar_camposVacios);
                                      } else {
                                        /* controller
                                      .crearProyecto(
                                          textNombreController.text.trim(),
                                          modulo,
                                          correoUsuariosSeleccionados)
                                      .then((value) {
                                    if (!value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              snackBar_registroFallido);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              snackBar_registroExitoso);
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          HomePage.route, (route) => false);
                                    }
                                  }); */
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromARGB(255, 51, 51, 51),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                    ),
                                    child: const Text("Evaluar"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ])
                ],
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
      floatingActionButton: Session().rol == "Alumno"
          ? FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 51, 51, 51),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CreateDocumentPage(proyectoId: widget.id),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
