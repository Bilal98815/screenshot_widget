import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot_widget/screenshot_exception.dart';

class ScreenshotController {
  /// A unique [GlobalKey] for identifying the widget to be captured.
  ///
  /// Each instance of [ScreenshotController] should have its own [GlobalKey] to
  /// capture screenshots of different widgets. This key is used to find the widget's
  /// render object and capture its content as an image.
  final GlobalKey screenshotKey = GlobalKey();

  Future<File?> captureScreenshot(BuildContext context) async {
    try {
      RenderRepaintBoundary boundary = screenshotKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        throw ScreenshotException("Failed to convert image to byte data.");
      }

      Uint8List pngBytes = byteData.buffer.asUint8List();

      final directory = await getApplicationDocumentsDirectory();
      DateTime now = DateTime.now();
      String timestamp = '${now.minute}_${now.second}';
      final imagePath = File('${directory.path}/screenshot-$timestamp.png');
      await imagePath.writeAsBytes(pngBytes);
      return imagePath;
    } catch (e) {
      throw ScreenshotException(e.toString());
    }
  }
}
