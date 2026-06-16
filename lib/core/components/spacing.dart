import 'package:flutter/material.dart';

class HeightSpace extends StatelessWidget {
  const HeightSpace(this.height, {super.key});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}


class WidthSpace extends StatelessWidget {
  const WidthSpace(this.width, {super.key});
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}