import 'package:classroom_project/modules/internet/internet_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InternetConnectivityDialog extends StatelessWidget {
  const InternetConnectivityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('No Internet Connection'),
      content: const Text('Please check your internet connection and try again.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class DialogHasConnection extends StatefulWidget {
  const DialogHasConnection({super.key, required this.body});

  final Widget body;

  @override
  State<DialogHasConnection> createState() => _DialogHasConnectionState();
}

class _DialogHasConnectionState extends State<DialogHasConnection> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final hasConnection = Modular.get<InternetConnectivity>().hasConnection;
        if (!hasConnection) {
          showDialog(
            context: context,
            builder: (context) => const InternetConnectivityDialog(),
          );
        }

        return widget.body;
      },
    );
  }
}
