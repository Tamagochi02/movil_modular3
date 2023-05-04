import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/documentos/infoDocumento_vista.dart';

class DocumentCard extends StatelessWidget {
  final String nombre;
  final String titulo;
  final String etapa;
  final String id;
  const DocumentCard({
    Key? key,
    this.nombre = "",
    this.titulo = "",
    this.etapa = "",
    this.id = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfoDocumentPage(
                documentoId: id
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          width: double.maxFinite,
          height: 160,
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 25,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 215, 215, 215),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      etapa,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )),
        ));
  }
}
