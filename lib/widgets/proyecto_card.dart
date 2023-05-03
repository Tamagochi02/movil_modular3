import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/alumno/proyecto/infoProyecto_vista.dart';

class ProjectCard extends StatelessWidget {
  final String nombreProyecto;
  final String modulo;
  final String estado;
  final String evaluacion;
  final String id;

  const ProjectCard({
    Key? key,
    this.nombreProyecto = "",
    this.modulo = "",
    this.estado = "",
    this.evaluacion = "",
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
          height: null,
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombreProyecto,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    height: 25,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 215, 215, 215),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      modulo,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 25,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 215, 215, 215),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      estado,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 25,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 215, 215, 215),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      evaluacion,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )),
        ));
  }
}
