import 'package:classroom_project/modules/internet/internet_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TitleHasConnection extends StatefulWidget {
  const TitleHasConnection({super.key});

  @override
  State<TitleHasConnection> createState() => _TitleHasConnectionState();
}

class _TitleHasConnectionState extends State<TitleHasConnection> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final hasConnection = Modular.get<InternetConnectivity>().hasConnection;
        return Text(
          hasConnection ? "Classroom App is online" : "Classroom App is offline",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
