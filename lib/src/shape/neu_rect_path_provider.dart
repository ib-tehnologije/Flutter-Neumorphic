import '../../flutter_neu.dart';

class NeuRectPathProvider extends NeuPathProvider {
  const NeuRectPathProvider({Listenable? reclip});

  @override
  bool shouldReclip(NeuPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..close();
  }

  @override
  bool get oneGradientPerPath => false;
}
