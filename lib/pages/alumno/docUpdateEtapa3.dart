import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DocUpdate3Page extends StatefulWidget {
  static const String route = "/docUpdate3View";
  const DocUpdate3Page({Key? key}) : super(key: key);

  @override
  State<DocUpdate3Page> createState() => _DocUpdate3PageState();
}

class _DocUpdate3PageState extends State<DocUpdate3Page> {
  bool showDropdownStudents = false;
  bool showDropdownTeachers = false;
  bool fileChoosed = false;
  String filee = '';
  String doc = "prueba.pdf"; // Variable donde obtendrá el documento registrado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informe Final",
          style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
          color: const Color.fromARGB(255, 51, 51, 51),
        ),
      ),
      //
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        //
        child: ListView(children: [
          const TextField(
            decoration: InputDecoration(label: Text("Nombre:")),
          ),
          const SizedBox(height: 35),
          const TextField(
            decoration: InputDecoration(label: Text("Titulo:")),
          ),
          const SizedBox(height: 45),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Tipo de espaciado entre los componentes de row
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: const Color.fromARGB(255, 224, 83, 72)),
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        PlatformFile file = result.files
                            .first; // variable que guarda info del documento
                        filee = file.name;
                        fileChoosed = true;
                        setState(() {});
                      } else {
                        // si el usuario no sube nada
                        fileChoosed = false;
                      }
                    },
                    child: const Icon(
                      Icons.picture_as_pdf_outlined,
                      size: 60,
                    )),
              ),
              Text(fileChoosed ? filee : doc)
            ],
          ),
          //
          const SizedBox(height: 45),
          //
          const TextField(
            decoration: InputDecoration(label: Text("Asesor:")),
            enabled: false,
          ),
          //
          const SizedBox(height: 45),
          //
          Card(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromARGB(255, 51, 51, 51),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 200,
                  child: ListView(
                    children: const [
                      Text("Observaciones"),
                      TextField(
                        enabled: false,
                        maxLines: 100, //o nulo,
                      ),
                    ],
                  )),
            ),
          ),
          //
          const SizedBox(height: 45),
          //
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 68, 117, 223),
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text("Actualizar datos"),
          )
        ]),
      ),
    );
  }
}
