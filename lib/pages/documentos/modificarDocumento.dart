import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:movil_modular3/controladores/documento_controlador.dart';
import 'package:movil_modular3/modelos/archivo2.dart';
import 'package:movil_modular3/modelos/sesion.dart';
import 'package:movil_modular3/pages/documentos/infoDocumento_vista.dart';

class EditDocumentPage extends StatefulWidget {
  static const String route = "/editdocument";
  final String proyectoId;
  final String documentoId;
  final String documentoNombre;
  final String documentoTitulo;
  final String documentoEtapa;
  final String etapa3Id;
  const EditDocumentPage(
      {Key? key,
      this.proyectoId = "",
      this.documentoId = "",
      this.documentoNombre = "",
      this.documentoEtapa = "",
      this.documentoTitulo = "",
      this.etapa3Id = ""})
      : super(key: key);

  @override
  State<EditDocumentPage> createState() => _EditDocumentPageState();
}

class _EditDocumentPageState extends State<EditDocumentPage> {
  final controller = DocumentController();
  String nombreArchivo = "";
  String url = "";
  File? archivoSeleccionado;
  late String archivoBase64;
  Filee2? archivo;

  Future<void> seleccionarArchivo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        archivoSeleccionado = File(result.files.single.path ?? '');
        nombreArchivo = result.files.single.name;
        List<int> bytes = archivoSeleccionado!.readAsBytesSync();
        archivoBase64 = base64Encode(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Modificar Documento",
            style: TextStyle(color: Color.fromARGB(255, 51, 51, 51))),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoDocumentPage(
                        proyectoId: widget.proyectoId,
                        documentoId: widget.documentoId),
                  ),
                  (route) => false);
            },
            icon: const Icon(
              Icons.close,
              color: Color.fromARGB(255, 51, 51, 51),
            )),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: ListView(children: [
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: TextEditingController(text: widget.documentoNombre),
            decoration: const InputDecoration(
              label:
                  Text("Nombre del documento", style: TextStyle(fontSize: 19)),
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
            controller: TextEditingController(text: widget.documentoTitulo),
            decoration: const InputDecoration(
              label:
                  Text("Título del documento", style: TextStyle(fontSize: 19)),
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
            controller: TextEditingController(text: widget.documentoEtapa),
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
          if (archivoSeleccionado != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    seleccionarArchivo();
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.7, // obtiene el tamaño de la pantalla
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
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
                                    color: archivoSeleccionado != null
                                        ? Colors.green
                                        : const Color.fromARGB(
                                            255, 198, 74, 67),
                                    borderRadius: BorderRadius.circular(10)),
                                child: archivoSeleccionado != null
                                    ? const Icon(Icons.done_outline_rounded)
                                    : const Icon(Icons.file_upload_outlined),
                              ),
                            ),
                            archivoSeleccionado != null
                                ? Text(nombreArchivo)
                                : const Text('Selecciona un archivo PDF'),
                          ],
                        ),
                      )),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        nombreArchivo = "";
                        archivoSeleccionado = null;
                      });
                    },
                    icon: const Icon(Icons.close_rounded))
              ],
            )
          else
            InkWell(
              onTap: () {
                seleccionarArchivo();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
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
                                color: archivoSeleccionado != null
                                    ? Colors.green
                                    : const Color.fromARGB(255, 198, 74, 67),
                                borderRadius: BorderRadius.circular(10)),
                            child: archivoSeleccionado != null
                                ? const Icon(Icons.done_outline_rounded)
                                : const Icon(Icons.file_upload_outlined),
                          ),
                        ),
                        archivoSeleccionado != null
                            ? Text(nombreArchivo)
                            : const Text('Selecciona un archivo PDF'),
                      ],
                    ),
                  )),
            ),
          const SizedBox(height: 240),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                const snackBar_camposVacios = SnackBar(
                  content: Text('Debes Subir un archivo'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                );
                const snackBar_actualizacionExitosa = SnackBar(
                  content: Text('Se ha modificado con éxito'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 1),
                );
                const snackBar_actualizacionFallida = SnackBar(
                  content: Text('Algo salió mal, no ha sido modificado'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                );

                if (archivoSeleccionado == null || nombreArchivo.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar_camposVacios);
                } else {
                  archivo = await controller.subirArchivo(
                      "pdf", archivoBase64, "", "Etapa3-${Session().userId}");
                  print(archivo!.media);
                  print(widget.etapa3Id);
                  controller
                      .actualizarEtapa3(archivo!.media, widget.etapa3Id)
                      .then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar_actualizacionExitosa);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoDocumentPage(
                                proyectoId: widget.proyectoId,
                                documentoId: widget.documentoId),
                          ),
                          (route) => false);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar_actualizacionFallida);
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
              child: const Text("Modificar"),
            ),
          )
        ]),
      ),
    );
  }
}
