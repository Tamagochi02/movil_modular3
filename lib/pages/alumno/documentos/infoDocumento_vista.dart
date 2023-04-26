import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:movil_modular3/controladores/documento_controlador.dart';
import 'package:movil_modular3/modelos/documento.dart';
import 'package:movil_modular3/pages/alumno/proyecto/infoProyecto_vista.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class InfoDocumentPage extends StatefulWidget {
  static const String route = "/infoDocument";
  final String documentoId;
  const InfoDocumentPage({Key? key, String? documentoId})
      : documentoId = documentoId ?? "",
        super(key: key);

  @override
  State<InfoDocumentPage> createState() => _InfoDocumentPageState();
}

class _InfoDocumentPageState extends State<InfoDocumentPage> {
  final controller = DocumentController();
  Document? document;
  bool estaCargando = true;
  dynamic _futureArchivo = "";

  @override
  void initState() {
    // TODO: implement initState
    controller.obtenerDocumentoPorId(widget.documentoId).then((value) {
      setState(() {
        document = value;
        estaCargando = false;
      });
    });

/*     controller.obtenerArchivo(document!.docEtapa3.last.url).then((value) {
      setState(() {
        _futureArchivo = value;
      });
    }); */
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (document != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: ListView(children: [
                TextField(
                  readOnly: true,
                  textCapitalization: TextCapitalization.sentences,
                  controller: TextEditingController(text: document!.nombre),
                  decoration: const InputDecoration(
                    label: Text("Nombre del documento",
                        style: TextStyle(fontSize: 19)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: TextEditingController(text: document!.titulo),
                  decoration: const InputDecoration(
                    label: Text("Título del documento",
                        style: TextStyle(fontSize: 19)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
                  controller: TextEditingController(text: document!.etapa),
                  decoration: const InputDecoration(
                    label: Text("Etapa", style: TextStyle(fontSize: 19)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                /* if(document!.etapa == "etapa_1")
                if(document!.etapa == "etapa_2") */
                if (document!.etapa == "etapa_3")
                  InkWell(
                    onTap: () {
                      /* print(_futureArchivo);
                      PDFView(filePath: _futureArchivo); */
                    },
                    child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 243, 195, 195),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text("PDF",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const Text('Visualizar documento registrado'),
                            ],
                          ),
                        )),
                  ),
              ]),
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
