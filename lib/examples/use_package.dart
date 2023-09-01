import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class UsePackageScreen extends StatefulWidget {
  const UsePackageScreen({super.key});

  @override
  State<UsePackageScreen> createState() => _UsePackageScreenState();
}

class _UsePackageScreenState extends State<UsePackageScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Use package'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RepaintBoundary(
              child: const FlutterLogo(
                size: 50,
              )
                  .animate(controller: _controller, autoPlay: false)
                  .rotate(duration: const Duration(seconds: 1)),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => _controller.forward(from: 0),
                child: const Text('Rotate')),
          ],
        ),
      ),
    );
  }
}
