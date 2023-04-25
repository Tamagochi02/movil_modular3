import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/documento.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:movil_modular3/pages/alumno/documentos/crearDocumento_vista.dart';
import 'package:movil_modular3/controladores/documento_controlador.dart';
import 'package:movil_modular3/controladores/proyecto_controlador.dart';

class InfoProjectPage extends StatefulWidget {
  final String id;
  static const String route = "/infoProject";
  const InfoProjectPage({Key? key, String? id})
      : id = id ?? "",
        super(key: key);

  @override
  State<InfoProjectPage> createState() => _InfoProjectPageState();
}

class _InfoProjectPageState extends State<InfoProjectPage> {
  final projectController = ProjectController();
  final documentController = DocumentController();
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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Proyecto",
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
                                width: 100,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 215, 215, 215),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(proyecto!.evaluacion)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Documentos:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 51, 51, 51),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateDocumentPage(proyectoId: widget.id),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
