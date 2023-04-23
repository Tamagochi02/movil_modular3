import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/alumno/proyecto/infoProyecto_vista.dart';

class DocumentStudentCard extends StatelessWidget {
  final String nombre;
  final String titulo;
  final String etapa;
  final String id;
  const DocumentStudentCard({
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
              builder: (context) => InfoProjectPage(
                id: id,
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 215, 215, 215),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      titulo,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
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
