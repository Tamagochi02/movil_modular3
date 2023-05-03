import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/documento.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:movil_modular3/pages/alumno/documentos/crearDocumento_vista.dart';
import 'package:movil_modular3/controladores/documento_controlador.dart';
import 'package:movil_modular3/controladores/proyecto_controlador.dart';
import 'package:movil_modular3/pages/home.dart';
import 'package:movil_modular3/widgets/documento_card.dart';
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
                    width: MediaQuery.of(context).size.width * 0.9, // obtiene el tamaño de la pantalla
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
                                TextEditingController(text: proyecto!.nombre),
                            decoration: const InputDecoration(
                              label: Text("Nombre del proyecto",
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
                          const SizedBox(height: 15),
                          const Divider(),
                          const SizedBox(height: 15),
                          const Text("Integrantes:",
                              style:
                                  TextStyle(fontSize: 19, color: Colors.black)),
                          const SizedBox(height: 15),
                          DataTable(
                            border: TableBorder(
                                borderRadius: BorderRadius.circular(10)),
                            columns: const [
                              DataColumn(label: Text('Nombre')),
                              DataColumn(label: Text('Matrícula')),
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('Juan')),
                                DataCell(Text('Madrid')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('María')),
                                DataCell(Text('Barcelona')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Pedro')),
                                DataCell(Text('Valencia')),
                              ]),
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
                      Column(children: [
                        DocumentCard(
                          nombre: documento.nombre,
                          titulo: documento.titulo,
                          etapa: documento.etapa,
                          id: documento.id,
                        ),
                        const SizedBox(height: 10)
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
