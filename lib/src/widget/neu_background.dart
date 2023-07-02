import 'package:flutter/widgets.dart';

import '../../flutter_neu.dart';

/// A container that takes the current [NeuTheme] baseColor as backgroundColor
/// @see [NeuTheme]
///
///
/// It can provide too a roundRect clip of the screen border using [borderRadius], [margin] and [backendColor]
///
/// ```
/// NeumorphicBackground(
///      borderRadius: BorderRadius.circular(12),
///      margin: EdgeInsets.all(12),
///      child: ...`
/// )
/// ```
@immutable
class NeuBackground extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color backendColor;
  final BorderRadius? borderRadius;

  const NeuBackground({
    this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backendColor = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.margin,
      color: this.backendColor,
      child: ClipRRect(
        borderRadius: this.borderRadius ?? BorderRadius.circular(0),
        child: AnimatedContainer(
          color: NeuTheme.baseColor(context),
          padding: this.padding,
          duration: const Duration(milliseconds: 100),
          child: this.child,
        ),
      ),
    );
  }
}
