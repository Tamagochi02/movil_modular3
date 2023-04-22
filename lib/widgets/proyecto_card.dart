import 'package:flutter/material.dart';
import 'package:movil_modular3/pages/alumno/proyecto/infoProyecto_vista.dart';

class ProjectCard extends StatelessWidget {
  final String nombreProyecto;
  final String modulo;
  final String estado;
  final String evaluacion;
  const ProjectCard({
    Key? key,
    this.nombreProyecto = "",
    this.modulo = "",
    this.estado = "",
    this.evaluacion = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, InfoProjectPage.route);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 51, 51, 51),
          ),
          width: double.maxFinite,
          height: 140,
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombreProyecto,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    modulo,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    estado,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    evaluacion,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              )),
        ));
  }
}
