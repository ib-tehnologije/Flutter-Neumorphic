import 'package:flutter/widgets.dart';

import '../../../flutter_neu.dart';

class NeuBoxShapeClipper extends StatelessWidget {
  final NeuBoxShape shape;
  final Widget? child;

  NeuBoxShapeClipper({required this.shape, this.child});

  CustomClipper<Path>? _getClipper(NeuBoxShape shape) {
    return shape.customShapePathProvider;
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _getClipper(this.shape),
      child: child,
    );
  }
}
