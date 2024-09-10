

import 'package:flutter/material.dart';

class CustomOverlay extends StatelessWidget {
  const CustomOverlay({
    required this.controller,
    super.key,
  });

  final SlidingPanelController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[800],
      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20).copyWith(top: 0),
        child: Column(
          children: [
            const OverlayFeedback(),
            const SizedBox(height: 20),
            const Text(
              'This is my custom overlay',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeBarrierColor(const Color.fromARGB(128, 147, 198, 242));
              },
              child: const Text('Change Barrier Color'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.close();
              },
              child: const Text('Close Overlay'),
            ),
          ],
        ),
      ),
    );
  }
}

class OverlayFeedback extends StatelessWidget {
  const OverlayFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
      ),
    );
  }
}

class SlidingUpPanelWidget extends StatefulWidget {
  const SlidingUpPanelWidget({
    super.key,
    required this.body,
    required this.feedback,
    required this.overlay,
    this.controller,
    this.backgroundColor,
  });

  final Widget body; // O restante da página
  final Widget feedback; // O que será exibido enquanto o Overlay não estiver sendo exibido
  final Widget overlay; // O que será exibido quando o Overlay estiver em exibição
  final SlidingPanelController? controller; //Controller do Overlay
  final Color? backgroundColor; //Cor de background do Overlay

  @override
  State<SlidingUpPanelWidget> createState() => _SlidingUpPanelWidgetState();
}

class _SlidingUpPanelWidgetState extends State<SlidingUpPanelWidget> with SingleTickerProviderStateMixin {
  late SlidingPanelController controller;

  @override
  void initState() {
    super.initState();

    final AnimationController animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final Animation<double> animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linearToEaseOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller = widget.controller ?? SlidingPanelController();

      controller
        ..context = context
        ..animationController = animationController
        ..animation = animation
        ..barrierColor = widget.backgroundColor
        ..overlayWidget = widget.overlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.isPanelOpen) {
          controller.close();
          return false;
        }

        return true;
      },
      child: Stack(
        children: [
          widget.body,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dy < -200) {
                  controller.open();
                }
              },
              child: widget.feedback,
            ),
          ),
        ],
      ),
    );
  }
}

class SlidingPanelController {
  //Context
  late final BuildContext context;

  //Animation
  late final AnimationController animationController;
  late final Animation<double> animation;

  //Overlay
  OverlayEntry? _overlay;
  OverlayState? _overlayState;

  //Widget
  Color? barrierColor;
  Widget? overlayWidget;

  //State
  bool _isOpen = false;

  void open() {
    if (!_isOpen) {
      _showOverlay();
    }
    _isOpen = true;
  }

  void close() {
    if (_overlay!.mounted) {
      _overlay!.remove();
      animationController.reset();
    }
    _overlay = null;
    _isOpen = false;
  }

  void _updateOverlay() {
    if (_isOpen) {
      _overlay!.markNeedsBuild();
    }
  }

  void changeBarrierColor(Color color) {
    barrierColor = color;
    _updateOverlay();
  }

  void _showOverlay() {
    _overlayState = Overlay.of(context);

    _overlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: FadeTransition(
                opacity: animation,
                child: ColoredBox(
                  color: barrierColor ?? const Color.fromARGB(150, 18, 18, 18),
                  child: GestureDetector(
                    onTap: () {
                      close();
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizeTransition(
                sizeFactor: animation,
                child: overlayWidget,
              ),
            ),
          ],
        );
      },
    );

    _overlayState!.insert(_overlay!);
    animationController.forward();
  }

  bool get isPanelOpen => _isOpen;
}