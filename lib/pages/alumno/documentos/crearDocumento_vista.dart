import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:movil_modular3/controladores/documento_controlador.dart';
import 'package:movil_modular3/pages/alumno/proyecto/infoProyecto_vista.dart';

class CreateDocumentPage extends StatefulWidget {
  static const String route = "/createdocument";
  final String proyectoId;
  const CreateDocumentPage({Key? key, String? proyectoId})
      : proyectoId = proyectoId ?? "",
        super(key: key);

  @override
  State<CreateDocumentPage> createState() => _CreateDocumentPageState();
}

class _CreateDocumentPageState extends State<CreateDocumentPage> {
  final textNombreController = TextEditingController();
  final textTituloController = TextEditingController();
  final controller = DocumentController();
  String etapa = "etapa_3";
  String nombreArchivo = "";
  String url = "";
  File? archivoSeleccionado;

  Future<void> seleccionarArchivo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        archivoSeleccionado = File(result.files.single.path ?? '');
        nombreArchivo = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Crear Documento",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: ListView(children: [
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textNombreController,
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
            controller: textTituloController,
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
            controller: TextEditingController(text: "Etapa 3"),
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
                      width: 300,
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
                    textTituloController.text.isEmpty ||
                    archivoSeleccionado == null ||
                    nombreArchivo.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar_camposVacios);
                } else {
                  await archivoSeleccionado?.copy(
                      'lib\\assets\\${archivoSeleccionado?.path.split('\\').last}');
                  obtenerUrlEtapa3(nombreArchivo).then((value) {
                    url = value;
                  });
                  controller
                      .crearDocumento(
                          textNombreController.text.trim(),
                          textTituloController.text.trim(),
                          etapa,
                          widget.proyectoId)
                      .then((value) {
                    controller.crearEtapa3(url, value).then((value) {
                      if (!value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar_registroFallido);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar_registroExitoso);
                        Navigator.pushNamedAndRemoveUntil(
                            context, InfoProjectPage.route, (route) => false);
                      }
                    });
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

  Future<String> obtenerUrlEtapa3(String fileName) async {
    // Construimos la ruta del archivo
    final String filePath = 'lib/assets/$fileName';

    // Verificamos si el archivo existe
    if (await File(filePath).exists()) {
      // El archivo existe
      return filePath;
    } else {
      throw Exception("No existe el $fileName");
    }
  }
}
