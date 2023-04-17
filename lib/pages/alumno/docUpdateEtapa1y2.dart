import 'package:flutter/material.dart';

class DocUpdate1and2Page extends StatefulWidget {
  final String typeDoc;
  static const String route = "/docUpdate1and2View";

  const DocUpdate1and2Page({Key? key, this.typeDoc = " "}) : super(key: key);

  @override
  State<DocUpdate1and2Page> createState() => _DocUpdate1and2PageState();
}

class _DocUpdate1and2PageState extends State<DocUpdate1and2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.typeDoc,
          style: const TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
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
                      // Generar archivo pdf y visualizarlo
                    },
                    child: const Icon(
                      Icons.picture_as_pdf_outlined,
                      size: 60,
                    )),
              ),
              const Text("Abrir documento registrado")
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
