import 'dart:ui';

import 'package:flutter/foundation.dart';

/// A custom offset that define a source of light used to project a shadow of a widget
/// left -1 <= dx <= 1 right
/// top -1 <= dy <= 1 bottom
///
/// constants like "top", "topLeft", "topRight" are providen in LightSource
///
@immutable
class NeuLightSource {
  final double dx;
  final double dy;

  const NeuLightSource(this.dx, this.dy);

  Offset get offset => Offset(dx, dy);

  static const top = const NeuLightSource(0, -1);
  static const topLeft = const NeuLightSource(-1, -1);
  static const topRight = const NeuLightSource(1, -1);
  static const bottom = const NeuLightSource(0, 1);
  static const bottomLeft = const NeuLightSource(-1, 1);
  static const bottomRight = const NeuLightSource(1, 1);
  static const left = const NeuLightSource(-1, 0);
  static const right = const NeuLightSource(1, 0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeuLightSource &&
          runtimeType == other.runtimeType &&
          offset == other.offset;

  @override
  int get hashCode => offset.hashCode;

  Offset toOffset(double distance) {
    return offset.scale(distance, distance);
  }

  @override
  String toString() {
    return 'LightSource{dx: $dx, dy: $dy}';
  }

  NeuLightSource invert() => NeuLightSource(dx * -1, dy * -1);

  static NeuLightSource? lerp(NeuLightSource? a, NeuLightSource? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    if (a == b) return a;
    if (t == 0.0) return a;
    if (t == 1.0) return b;

    return NeuLightSource(
      (a.dx != b.dx ? lerpDouble(a.dx, b.dx, t) : a.dx)!,
      (a.dy != b.dy ? lerpDouble(a.dy, b.dy, t) : a.dy)!,
    );
  }

  NeuLightSource copyWith({
    double? dx,
    double? dy,
  }) {
    return NeuLightSource(
      dx ?? this.dx,
      dy ?? this.dy,
    );
  }
}
