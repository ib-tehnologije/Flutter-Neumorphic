import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import '../../flutter_neu.dart';

import 'clipper/neu_box_shape_clipper.dart';

export '../decoration/neu_decorations.dart';

/// The main container of the Neumorphic UI KIT
/// it takes a Neumorphic style @see [NeuStyle]
///
/// it's clipped using a [NeuBoxShape] (circle, roundrect, stadium)
///
/// It can be, depending on its [NeuStyle.shape] : [NeuShape.concave],  [NeuShape.convex],  [NeuShape.flat]
///
/// if [NeuStyle.depth] < 0 ----> use the emboss shape
///
/// The container animates any change for you, with [duration] ! (including style / theme / size / etc.)
///
/// [drawSurfaceAboveChild] enable to draw emboss, concave, convex effect above this widget child
///
/// drawSurfaceAboveChild - UseCase 1 :
///
///   put an image inside a neumorphic(concave) :
///   drawSurfaceAboveChild=false -> the concave effect is below the image
///   drawSurfaceAboveChild=true -> the concave effect is above the image, the image seems concave
///
/// drawSurfaceAboveChild - UseCase 2 :
///   put an image inside a neumorphic(emboss) :
///   drawSurfaceAboveChild=false -> the emboss effect is below the image -> not visible
///   drawSurfaceAboveChild=true -> the emboss effeect effect is above the image -> visible
///
@immutable
class Neu extends StatelessWidget {
  static const DEFAULT_DURATION = const Duration(milliseconds: 100);
  static const DEFAULT_CURVE = Curves.linear;

  static const double MIN_DEPTH = -20.0;
  static const double MAX_DEPTH = 20.0;

  static const double MIN_INTENSITY = 0.0;
  static const double MAX_INTENSITY = 1.0;

  static const double MIN_CURVE = 0.0;
  static const double MAX_CURVE = 1.0;

  final Widget? child;

  final NeuStyle? style;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Curve curve;
  final Duration duration;
  final bool
      drawSurfaceAboveChild; //if true => boxDecoration & foreground decoration, else => boxDecoration does all the work

  Neu({
    Key? key,
    this.child,
    this.duration = Neu.DEFAULT_DURATION,
    this.curve = Neu.DEFAULT_CURVE,
    this.style,
    this.textStyle,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.drawSurfaceAboveChild = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = NeuTheme.currentTheme(context);
    final NeuStyle style = (this.style ?? NeuStyle())
        .copyWithThemeIfNull(theme)
        .applyDisableDepth();

    return _NeuContainer(
      padding: this.padding,
      textStyle: this.textStyle,
      drawSurfaceAboveChild: this.drawSurfaceAboveChild,
      duration: this.duration,
      style: style,
      curve: this.curve,
      margin: this.margin,
      child: this.child,
    );
  }
}

class _NeuContainer extends StatelessWidget {
  final NeuStyle style;
  final TextStyle? textStyle;
  final Widget? child;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;
  final bool drawSurfaceAboveChild;
  final EdgeInsets padding;

  _NeuContainer({
    Key? key,
    this.child,
    this.textStyle,
    required this.padding,
    required this.margin,
    required this.duration,
    required this.curve,
    required this.style,
    required this.drawSurfaceAboveChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = this.style.boxShape ?? NeuBoxShape.rect();

    return DefaultTextStyle(
      style: this.textStyle ?? material.Theme.of(context).textTheme.bodyMedium!,
      child: AnimatedContainer(
        margin: this.margin,
        duration: this.duration,
        curve: this.curve,
        child: NeuBoxShapeClipper(
          shape: shape,
          child: Padding(
            padding: this.padding,
            child: this.child,
          ),
        ),
        foregroundDecoration: NeuDecoration(
          isForeground: true,
          renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
          splitBackgroundForeground: this.drawSurfaceAboveChild,
          style: this.style,
          shape: shape,
        ),
        decoration: NeuDecoration(
          isForeground: false,
          renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
          splitBackgroundForeground: this.drawSurfaceAboveChild,
          style: this.style,
          shape: shape,
        ),
      ),
    );
  }
}
