import 'package:flutter/material.dart';

class BuildInScreen extends StatefulWidget {
  const BuildInScreen({super.key});

  @override
  State<BuildInScreen> createState() => _BuildInScreenState();
}

class _BuildInScreenState extends State<BuildInScreen> {
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Build-in widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: turns,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(
                size: 50,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    turns++;
                  });
                },
                child: const Text('Rotate')),
          ],
        ),
      ),
    );
  }
}
