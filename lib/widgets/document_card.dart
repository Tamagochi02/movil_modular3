import 'package:flutter/material.dart';

enum DocStatus { sinEntregar, entregado, debeModificarse, revisado }

class DocumentCard extends StatelessWidget {
  final String title;
  final String docName;
  final DocStatus status;

  const DocumentCard(
      {Key? key,
      this.title = "",
      this.docName = "",
      this.status = DocStatus.sinEntregar})
      : super(key: key);

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
                  docName,
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
                      style: const TextStyle(color: Colors.greenAccent),
                    ),
                    Text(
                      docName != "Ninguno" ? "Ver" : "Registrar",
                      style: const TextStyle(color: Colors.blue),
                    )
                  ],
                )
              ],
            )),
      )
    );
//
  }
}
