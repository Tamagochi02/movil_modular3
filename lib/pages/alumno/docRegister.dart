import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DocRegisterPage extends StatefulWidget {
  static const String route = "/docregister";
  const DocRegisterPage({Key? key}) : super(key: key);

  @override
  State<DocRegisterPage> createState() => _DocRegisterPageState();
}

class _DocRegisterPageState extends State<DocRegisterPage> {
  bool showDropdownStudents = false;
  bool showDropdownTeachers = false;
  bool fileChoosed = false;
  String filee = '';

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
        child: ListView(children: [
          const TextField(
            decoration: InputDecoration(label: Text("Nombre:")),
          ),
          const SizedBox(height: 35),
          const TextField(
            decoration: InputDecoration(label: Text("Titulo:")),
          ),
          const SizedBox(height: 45),
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
              Text(fileChoosed ? filee : "Sube un archivo")
            ],
          ),
          //
          const SizedBox(height: 45),
          //
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
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text("Alumno 1")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text("Alumno 2")
                  ],
                ),
              ],
            ),
          //
          const SizedBox(height: 45),
          //
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
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text("Asesor 1")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text("Asesor 2")
                  ],
                ),
              ],
            ),
          //
          const SizedBox(height: 80),
          //
          SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 68, 117, 223),
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text("Registrar"),
            ),
          )
        ]),
      ),
    );
  }
}
