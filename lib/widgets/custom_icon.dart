import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => SweepGradient(
        colors: [
          Colors.indigo,
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.orange,
          Colors.red
        ],
        startAngle: 0,
        endAngle: 180,
      ).createShader(bounds),
      child: child,
    );
  }
}
