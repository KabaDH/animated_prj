import 'package:animated_prj/examples/animated_builder.dart';
import 'package:animated_prj/examples/no_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'examples/build_in.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter animations test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExampleButton(
              title: 'Build-in',
              newScreen: BuildInScreen(),
            ),
            ExampleButton(
              title: 'Animated builder',
              newScreen: AnimatedBuilderScreen(),
            ),
            ExampleButton(
              title: 'No builder animation',
              newScreen: NoBuilderScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleButton extends StatelessWidget {
  const ExampleButton(
      {super.key, required this.title, required this.newScreen});

  final String title;
  final Widget newScreen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => newScreen)),
        child: Text(title));
  }
}
