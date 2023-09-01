import 'dart:math';

import 'package:flutter/material.dart';

class NoBuilderScreen extends StatefulWidget {
  const NoBuilderScreen({super.key});

  @override
  State<NoBuilderScreen> createState() => _NoBuilderScreenState();
}

class _NoBuilderScreenState extends State<NoBuilderScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // late final Animation<double> angle;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(_controllerListener);
    // angle = Tween<double>(begin: 0.0, end: 2.0 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerListener);
    _controller.dispose();
    super.dispose();
  }

  _controllerListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('No Builder animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: _controller.value * 2.0 * pi,
              child: const FlutterLogo(
                size: 50,
              ),
            ),
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
