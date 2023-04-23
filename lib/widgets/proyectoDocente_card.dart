import 'package:flutter/material.dart';

class ProjectTeacherCard extends StatelessWidget {
  final String nombreProyecto;
  final String modulo;
  final String estado;
  final String evaluacion;
  const ProjectTeacherCard({
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
          /* Navigator.pushNamed(context, InfoProjectPage.route); */
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
                    nombreProyecto,
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Text(
                      modulo,
                      style: const TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 215, 215, 215),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Text(
                      estado,
                      style: const TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 215, 215, 215),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Text(
                      evaluacion,
                      style: const TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
