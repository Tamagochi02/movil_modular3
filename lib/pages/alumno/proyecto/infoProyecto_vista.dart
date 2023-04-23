import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/proyecto.dart';
import 'package:movil_modular3/pages/alumno/proyecto/proyecto_controlador.dart';

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
  final controller = ProjectController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      body: FutureBuilder(
        future: controller.obtenerProyectoPorId(widget.id),
        builder: (context, snapshot) {
          final proyecto = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
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
                        textCapitalization: TextCapitalization.sentences,
                        controller:
                            TextEditingController(text: proyecto?.nombre??''),
                        decoration: const InputDecoration(
                          label: Text("Nombre del proyecto",
                              style: TextStyle(fontSize: 19)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        controller:
                            TextEditingController(text: proyecto?.modulo??''),
                        decoration: const InputDecoration(
                          label: Text("Módulo", style: TextStyle(fontSize: 19)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 215, 215, 215),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(proyecto?.estado??'')),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 215, 215, 215),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(proyecto?.evaluacion??'')),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text("Documentos:", style: TextStyle(fontSize: 20, color: Colors.black))
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            /* Navigator.pushNamed(context, CreateProjectPage.route); */
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}
