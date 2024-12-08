# Screenshot Package

A Flutter package to capture a screenshot of any widget and return it as a `File`. This package provides a simple way to take screenshots using a `ScreenshotController` and a `ScreenshotWidget`. The captured screenshot can be saved, shared, or used as needed.

---

## Features

- Capture a widget's screenshot as an image.
- Returns the screenshot as a `File` for further use.
- Easy integration with `ScreenshotController` and `ScreenshotWidget`.

---

## Installation

To use this package, add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  screenshot: ^1.0.0
```

- Create instance of ScreenshotController and provide GlobalKey to it
- Wrap you widget whose screenshot you want to take with ScreenshotWidget and assign that controller to it
- Now call captureScreenshot(BuildContext) function with controller where you want to take screenshot


```
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
  // Create an instance of ScreenshotController
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
          // Capture the screenshot
          final file = await controller.captureScreenshot(context);
          print("${file?.path}"); // Print the file path
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

```