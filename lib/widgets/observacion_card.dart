import 'package:flutter/material.dart';

class ObservationCard extends StatelessWidget {
  final String observacion;

  const ObservationCard({
    Key? key,
    this.observacion = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfoProjectPage(
                id: id,
              ),
            ),
          ); */
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
                    observacion,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                ],
              )),
        ));
  }
}
