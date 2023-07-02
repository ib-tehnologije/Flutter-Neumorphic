import 'dart:math';

import '../../flutter_neu.dart';

class NeuCirclePathProvider extends NeuPathProvider {
  const NeuCirclePathProvider({Listenable? reclip});

  @override
  bool shouldReclip(NeuPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    final middleHeight = size.height / 2;
    final middleWidth = size.width / 2;
    return Path()
      ..addOval(Rect.fromCircle(
          center: Offset(middleWidth, middleHeight),
          radius: min(middleHeight, middleWidth)))
      ..close();
  }

  @override
  bool get oneGradientPerPath => false; //because only 1 path
}
