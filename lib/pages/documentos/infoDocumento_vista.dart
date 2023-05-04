import 'package:flutter/material.dart';
import 'package:movil_modular3/controladores/calificar_controlador.dart';
import 'package:movil_modular3/controladores/documento_controlador.dart';
import 'package:movil_modular3/modelos/documento.dart';
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/pages/proyecto/infoProyecto_vista.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDocumentPage extends StatefulWidget {
  static const String route = "/infoDocument";
  final String documentoId;
  final String proyectoId;
  const InfoDocumentPage(
      {Key? key, this.documentoId = "", this.proyectoId = ""})
      : super(key: key);

  @override
  State<InfoDocumentPage> createState() => _InfoDocumentPageState();
}

class _InfoDocumentPageState extends State<InfoDocumentPage> {
  final controller = DocumentController();
  Document? document;
  bool estaCargando = true;
  final evaluationnController = EvaluationController();
  final textObservacionesController = TextEditingController();
  bool _checkboxStatus1 = false;
  bool _checkboxStatus2 = false;
  bool _checkboxEvaluation1 = false;
  bool _checkboxEvaluation2 = false;
  bool _checkboxEvaluation3 = false;
  bool showDropdownStatus = false;
  bool showDropdownEvaluation = false;
  String estado = "";
  String evaluacion = "";

  @override
  void initState() {
    // TODO: implement initState
    controller.obtenerDocumentoPorId(widget.documentoId).then((value) {
      setState(() {
        document = value;
        estaCargando = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Detalles de Documento",
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
      backgroundColor: const Color.fromARGB(215, 255, 255, 255),
      body: Stack(
        children: [
          if (document != null)
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text("Información:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
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
                            maxLines: null,
                            textCapitalization: TextCapitalization.sentences,
                            controller:
                                TextEditingController(text: document!.nombre),
                            decoration: const InputDecoration(
                              label: Text("Nombre del documento",
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
                            maxLines: null,
                            textCapitalization: TextCapitalization.sentences,
                            controller:
                                TextEditingController(text: document!.titulo),
                            decoration: const InputDecoration(
                              label: Text("Título del documento",
                                  style: TextStyle(fontSize: 19)),
                              contentPadding:
                                  EdgeInsets.all(10),
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
                            textCapitalization: TextCapitalization.sentences,
                            controller:
                                TextEditingController(text: document!.etapa),
                            decoration: const InputDecoration(
                              label:
                                  Text("Etapa", style: TextStyle(fontSize: 19)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                          if (document!.etapa == "etapa_3")
                            Column(
                              children: [
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    final uri = Uri.https(
                                        'web-production-77aa.up.railway.app',
                                        '/assets/${document!.docEtapa3.last.url}');
                                    launchUrl(uri,
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: Container(
                                      width: 400,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 243, 195, 195),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: 20,
                                          children: [
                                            SizedBox(
                                              height: 70,
                                              width: 70,
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 198, 74, 67),
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                child: const Text("PDF",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            const Text(
                                                'Visualizar documento registrado'),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (Session().rol == "Alumno")
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.9, // obtiene el tamaño de la pantalla
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView(children: [
                          TextField(
                            readOnly: true,
                            maxLines: null,
                            controller: TextEditingController(text: ""),
                            decoration: const InputDecoration(
                              label: Text("Observaciones",
                                  style: TextStyle(fontSize: 19)),
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ]),
                      ),
                    ),

                    
                  if (Session().rol == "Docente")
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Evaluar:",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        showDropdownStatus =
                                            !showDropdownStatus;
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
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _checkboxEvaluation3,
                                            onChanged: (value) {
                                              setState(() {
                                                if (value != null && value) {
                                                  evaluacion = "Sin_evaluar";
                                                  _checkboxEvaluation3 = true;
                                                } else {
                                                  _checkboxEvaluation3 = false;
                                                }
                                              });
                                            },
                                          ),
                                          const Text('Sin evaluar'),
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
                                          EdgeInsets.all(10),
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
                                        // ignore: constant_identifier_names
                                        const snackBar_camposVacios = SnackBar(
                                          content: Text(
                                              'Debes llenar todos los campos'),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 1),
                                        );
                                        // ignore: constant_identifier_names
                                        const snackBar_registroExitoso =
                                            SnackBar(
                                          content:
                                              Text('Se ha evaluado con exito'),
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 1),
                                        );
                                        // ignore: constant_identifier_names
                                        const snackBar_registroFallido =
                                            SnackBar(
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
                                          evaluationnController
                                              .evaluar(estado, evaluacion,
                                                  widget.proyectoId)
                                              .then((value) {
                                            if (value) {
                                              evaluationnController
                                                  .crearObservacion(
                                                      textObservacionesController
                                                          .text
                                                          .trim(),
                                                      widget.documentoId)
                                                  .then((value) {
                                                if (value) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          snackBar_registroExitoso);
                                                  Navigator
                                                      .pushNamedAndRemoveUntil(
                                                          context,
                                                          InfoDocumentPage
                                                              .route,
                                                          (route) => false);
                                                }
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                      snackBar_registroFallido);
                                            }
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromARGB(
                                            255, 51, 51, 51),
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
                        ]),
                ],
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
    );
  }
}
