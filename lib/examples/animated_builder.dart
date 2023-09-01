import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderScreen extends StatefulWidget {
  const AnimatedBuilderScreen({super.key});

  @override
  State<AnimatedBuilderScreen> createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen>
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
        title: const Text('Animated builder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
                animation: _controller,
                child: const FlutterLogo(
                  size: 50,
                ),
                builder: (ctx, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * pi,
                    child: child,
                  );
                }),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.forward(from: 0);
                },
                child: const Text('Rotate')),
          ],
        ),
      ),
    );
  }
}
