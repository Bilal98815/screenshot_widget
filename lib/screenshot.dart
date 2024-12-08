library screenshot_widget;

import 'package:flutter/material.dart';
import 'package:screenshot_widget/screenshot_controller.dart';

class ScreenshotWidget extends StatelessWidget {
  const ScreenshotWidget({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.controller,
  });

  final Widget child;
  final Color backgroundColor;

  final ScreenshotController controller;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: controller.screenshotKey,
      child: Container(color: backgroundColor, child: child),
    );
  }
}
