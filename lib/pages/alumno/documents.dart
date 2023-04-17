import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/routeParamsModularProjectPage.dart';
import 'package:movil_modular3/pages/alumno/docRegister.dart';
import 'package:movil_modular3/pages/alumno/docUpdateEtapa1y2.dart';
import 'package:movil_modular3/pages/alumno/docUpdateEtapa3.dart';
import 'package:movil_modular3/widgets/navigation_drawer.dart' as widgets;

enum DocStatus { sinEntregar, entregado, debeModificarse, revisado }

class DocumentsPage extends StatelessWidget {
  final String docName1, docName2, docName3;
  final DocStatus status;

  static const String route = "/documents";
  const DocumentsPage(
      {Key? key,
      this.docName1 = "Ninguno",
      this.docName2 = "prueba",
      this.docName3 = "prueba",
      this.status = DocStatus.sinEntregar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 68, 117, 223),
          title: Text(RouteParamsModularProjectPage.title),
          centerTitle: true,
        ),
        drawer: const widgets.NavigationDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: ListView(
            children: [
              // Contenedores/cards de documentos:
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
                  width: double.maxFinite,
                  height: 200,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Estado del Arte",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20.0,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.info_outline,
                                      color: Colors.white))
                            ],
                          ),
                          Text(
                            docName1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                status.name,
                                style:
                                    const TextStyle(color: Colors.greenAccent),
                              ),
                              Text(
                                docName1 != "Ninguno" ? "Ver" : " ",
                                style: const TextStyle(color: Colors.blue),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                onTap: () {
                  if (docName1 == "Ninguno") {
                    // Debe registrarlo desde la plataforma web
                  } else {
                    Navigator.pushNamed(context, DocUpdate1and2Page.route);
                  }
                },
              ),
//
              const SizedBox(height: 17),
//
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
                  width: double.maxFinite,
                  height: 200,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Resumen",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20.0,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.info_outline,
                                      color: Colors.white))
                            ],
                          ),
                          Text(
                            docName2,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                status.name,
                                style:
                                    const TextStyle(color: Colors.greenAccent),
                              ),
                              Text(
                                docName2 != "Ninguno" ? "Ver" : " ",
                                style: const TextStyle(color: Colors.blue),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                onTap: () {
                  if (docName2 == "Ninguno") {
                    // Debe registrarlo desde la plataforma web
                  } else {
                    Navigator.pushNamed(context, DocUpdate1and2Page.route);
                  }
                },
              ),
//
              const SizedBox(height: 17),
//
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
                  width: double.maxFinite,
                  height: 200,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Informe Final",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            docName3,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                status.name,
                                style:
                                    const TextStyle(color: Colors.greenAccent),
                              ),
                              Text(
                                docName3 != "Ninguno" ? "Ver" : "Registrar",
                                style: const TextStyle(color: Colors.blue),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                onTap: () {
                  if (docName3 == "Ninguno") {
                    Navigator.pushNamed(context, DocRegisterPage.route);
                  } else {
                    Navigator.pushNamed(context, DocUpdate3Page.route);
                  }
                },
              ),
            ],
          ),
        ));
  }
}
