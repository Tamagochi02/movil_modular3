import 'package:flutter/material.dart';
import 'package:movil_modular3/modelos/routeParamsModularProjectPage.dart';
import 'package:movil_modular3/pages/alumno/documents.dart';

class ModuleCard extends StatelessWidget {
  final String title;
  final int numDocs;
  const ModuleCard({
    Key? key,
    this.title = "",
    this.numDocs = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 51, 51, 51),
          ),
          width: double.maxFinite,
          height: 200,
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "${numDocs}/3 documentos registrados",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ],
              )),
        ),
        onTap: () {
          RouteParamsModularProjectPage.assign(title, '');
          Navigator.pushNamedAndRemoveUntil(
              context, DocumentsPage.route, (route) => false);
        });
  }
}
