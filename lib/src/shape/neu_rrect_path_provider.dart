import '../../flutter_neu.dart';

class NeuRRectPathProvider extends NeuPathProvider {
  final BorderRadius borderRadius;

  const NeuRRectPathProvider(this.borderRadius, {Listenable? reclip});

  @override
  bool shouldReclip(NeuPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..addRRect(RRect.fromLTRBAndCorners(0, 0, size.width, size.height,
          topLeft: borderRadius.topLeft,
          topRight: borderRadius.topRight,
          bottomLeft: borderRadius.bottomLeft,
          bottomRight: borderRadius.bottomRight))
      ..close();
  }

  @override
  bool get oneGradientPerPath => false; //because only 1 path
}
