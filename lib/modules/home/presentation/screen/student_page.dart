import 'package:flutter/material.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Section"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("Alunos")),
              const SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}
