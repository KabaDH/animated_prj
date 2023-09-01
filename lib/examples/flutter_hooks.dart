import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UsePackageWithHooksScreen extends HookWidget {
  const UsePackageWithHooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(seconds: 1));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Use package and hooks'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RepaintBoundary(
              child: const FlutterLogo(
                size: 50,
              )
                  .animate(controller: controller, autoPlay: false)
                  .rotate(duration: const Duration(seconds: 1)),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => controller.forward(from: 0),
                child: const Text('Rotate')),
          ],
        ),
      ),
    );
  }
}
