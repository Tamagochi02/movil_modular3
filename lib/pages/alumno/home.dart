import 'package:flutter/material.dart';
import 'package:movil_modular3/widgets/module_card.dart';

class HomePage extends StatelessWidget {
  static const String route = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gestor Modular"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 52, 105, 221),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications)),
        ),
        //
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: ListView(
            children: const [
              ModuleCard(title: "Módulo I", numDocs: 0),
              SizedBox(height: 17),
              ModuleCard(title: "Módulo II", numDocs: 0),
              SizedBox(height: 17),
              ModuleCard(title: "Módulo III", numDocs: 0),
            ],
          ),
        ));
  }
}
