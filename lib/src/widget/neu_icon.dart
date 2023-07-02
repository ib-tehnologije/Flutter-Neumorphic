
import '../../flutter_neu.dart';

export '../decoration/neu_decorations.dart';

@immutable
class NeuIcon extends StatelessWidget {
  final IconData icon;
  final NeuStyle? style;
  final Curve curve;
  final double size;
  final Duration duration;

  NeuIcon(
    this.icon, {
    Key? key,
    this.duration = Neu.DEFAULT_DURATION,
    this.curve = Neu.DEFAULT_CURVE,
    this.style,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeuText(
      String.fromCharCode(icon.codePoint),
      textStyle: NeuTextStyle(
        fontSize: size,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
      duration: this.duration,
      style: style,
      curve: this.curve,
    );
  }
}
