import 'package:flutter/material.dart';
import 'package:screenshot_widget/screenshot.dart';
import 'package:screenshot_widget/screenshot_controller.dart';

void main() {
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScreenshotController controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Screenshot Example"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.screenshot_outlined),
        onPressed: () async {
          final file = await controller.captureScreenshot(context);
          print("${file?.path}");
        },
      ),
      body: ScreenshotWidget(
        backgroundColor: Colors.white,
        controller: controller,
        child: Container(
          width: 200,
          height: 150,
          color: Colors.yellow,
          child: const Center(child: Text("Screenshot to be taken of")),
        ),
      ),
    );
  }
}
