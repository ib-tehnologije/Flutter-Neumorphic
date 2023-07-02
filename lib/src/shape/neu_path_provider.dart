import '../../flutter_neu.dart';

abstract class NeuPathProvider extends CustomClipper<Path> {
  const NeuPathProvider({Listenable? reclip}) : super(reclip: reclip);

  @override
  Path getClip(Size size) {
    return getPath(size);
  }

  /// only used when shape == convex || concave
  /// when you have multiple path (with some moveTo) inside :
  /// true -> draw a different gradient for each sub path
  /// false -> draw an unique gradient for all the widget
  bool get oneGradientPerPath;

  Path getPath(Size size);

  @override
  bool shouldReclip(NeuPathProvider oldClipper) {
    return false;
  }
}
