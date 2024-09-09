import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../internet/presentation/widgets/text_has_connection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleHasConnection(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("My home page"),
          const SizedBox(height: 40),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("Cursos")),
              const SizedBox(width: 40),
              TextButton(onPressed: () => Modular.to.pushNamed("./students"), child: const Text("Alunos"))
            ],
          )
        ],
      ),
    );
  }
}
