import 'package:flutter/material.dart';

///Indicator to display loading progress.
///
class ProgressIndicatorWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? strokewidth;

  ///Creates a progress indicator.
  ///
  const ProgressIndicatorWidget({
    super.key,
    this.width,
    this.height,
    this.color,
    this.strokewidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 24,
      height: height ?? 24,
      padding: const EdgeInsets.all(2.0),
      child: CircularProgressIndicator(
        color: color ?? Colors.white,
        strokeWidth: strokewidth ?? 3,
      ),
    );
  }
}
