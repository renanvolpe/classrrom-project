import 'package:classroom_project/modules/home/presentation/widgets/overlay_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../internet/internet_connectivity.dart';
import '../../../internet/presentation/widgets/text_has_connection.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Modular.get<SlidingPanelController>();
   final hasConnection = Modular.get<InternetConnectivity>().hasConnection;
  @override
  void initState() {

    // hasConnection
    // Future.delayed(const Duration(seconds: 7), () {
    //   controller.open();
    // });
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanelWidget(
      controller: controller,
        feedback: const OverlayFeedback(),
        overlay: CustomOverlay(controller: controller),
      body: Scaffold(
        appBar: AppBar(
          title: const TitleHasConnection(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("My home page"),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      controller.open();
                    },
                    child: const Text("Cursos")),
                const SizedBox(width: 40),
                TextButton(onPressed: () => Modular.to.pushNamed("./students"), child: const Text("Alunos"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyOverlay extends StatelessWidget {
  const MyOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show pop-up dialog
            showOverlay(context);
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }

  void showOverlay(BuildContext context) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width * 0.2,
        child: Material(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.deepOrange,
            child: const Center(
              child: Text(
                'This is a pop-up dialog',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // Remove overlay entry after a delay
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
