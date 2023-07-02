import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../../flutter_neu.dart';
import '../neu_light_source.dart';
import 'neu_decoration_painter.dart';
import 'neu_emboss_decoration_painter.dart';

@immutable
class NeuDecoration extends Decoration {
  final NeuStyle style;
  final NeuBoxShape shape;
  final bool splitBackgroundForeground;
  final bool renderingByPath;
  final bool isForeground;

  NeuDecoration({
    required this.style,
    required this.isForeground,
    required this.renderingByPath,
    required this.splitBackgroundForeground,
    required this.shape,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    //print("createBoxPainter : ${style.depth}");
    if (style.depth != null && style.depth! >= 0) {
      return NeumorphicDecorationPainter(
        style: style,
        drawGradient: (isForeground && splitBackgroundForeground) ||
            (!isForeground && !splitBackgroundForeground),
        drawBackground: !isForeground,
        //only box draw background
        drawShadow: !isForeground,
        //only box draw shadow
        renderingByPath: this.renderingByPath,
        onChanged: onChanged ?? () {},
        shape: shape,
      );
    } else {
      return NeumorphicEmbossDecorationPainter(
        drawBackground: !isForeground,
        style: style,
        drawShadow: (isForeground && splitBackgroundForeground) ||
            (!isForeground && !splitBackgroundForeground),
        onChanged: onChanged ?? () {},
        shape: shape,
      );
    }
  }

  @override
  NeuDecoration lerpFrom(Decoration? a, double t) {
    if (a == null) return scale(t);
    if (a is NeuDecoration)
      return NeuDecoration.lerp(a, this, t)!;
    return super.lerpFrom(a, t) as NeuDecoration;
  }

  @override
  NeuDecoration lerpTo(Decoration? b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is NeuDecoration)
      return NeuDecoration.lerp(this, b, t)!;
    return super.lerpTo(b, t) as NeuDecoration;
  }

  NeuDecoration scale(double factor) {
    print("scale");
    return NeuDecoration(
        isForeground: this.isForeground,
        renderingByPath: this.renderingByPath,
        splitBackgroundForeground: this.splitBackgroundForeground,
        shape: NeuBoxShape.lerp(null, shape, factor)!,
        style: style.copyWith());
  }

  static NeuDecoration? lerp(
      NeuDecoration? a, NeuDecoration? b, double t) {
    //print("lerp $t ${a.style.depth}, ${b.style.depth}");

    if (a == null && b == null) return null;
    if (a == null) return b!.scale(t);
    if (b == null) return a.scale(1.0 - t);
    if (t == 0.0) {
      //print("return a");
      return a;
    }
    if (t == 1.0) {
      //print("return b (1.0)");
      return b;
    }

    var aStyle = a.style;
    var bStyle = b.style;

    return NeuDecoration(
        isForeground: a.isForeground,
        shape: NeuBoxShape.lerp(a.shape, b.shape, t)!,
        splitBackgroundForeground: a.splitBackgroundForeground,
        renderingByPath: a.renderingByPath,
        style: a.style.copyWith(
          border: NeuBorder.lerp(aStyle.border, bStyle.border, t),
          intensity: lerpDouble(aStyle.intensity, bStyle.intensity, t),
          surfaceIntensity:
              lerpDouble(aStyle.surfaceIntensity, bStyle.surfaceIntensity, t),
          depth: lerpDouble(aStyle.depth, bStyle.depth, t),
          color: Color.lerp(aStyle.color, bStyle.color, t),
          lightSource:
              NeuLightSource.lerp(aStyle.lightSource, bStyle.lightSource, t),
        ));
  }

  @override
  bool get isComplex => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeuDecoration &&
          runtimeType == other.runtimeType &&
          style == other.style &&
          shape == other.shape &&
          splitBackgroundForeground == other.splitBackgroundForeground &&
          isForeground == other.isForeground &&
          renderingByPath == other.renderingByPath;

  @override
  int get hashCode =>
      style.hashCode ^
      shape.hashCode ^
      splitBackgroundForeground.hashCode ^
      isForeground.hashCode ^
      renderingByPath.hashCode;
}
