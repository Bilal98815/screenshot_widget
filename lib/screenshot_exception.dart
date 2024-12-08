class ScreenshotException implements Exception {
  String error;

  ScreenshotException(this.error);

  @override
  String toString() => error;
}
