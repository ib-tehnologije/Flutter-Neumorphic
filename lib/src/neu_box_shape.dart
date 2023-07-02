import 'package:flutter_neumorphic/flutter_neu.dart';
import 'package:flutter_neumorphic/src/shape/neu_beveled_path_provider.dart';
import 'package:flutter_neumorphic/src/shape/neu_circle_path_provider.dart';
import 'package:flutter_neumorphic/src/shape/neu_rect_path_provider.dart';
import 'package:flutter_neumorphic/src/shape/neu_rrect_path_provider.dart';
import 'package:flutter_neumorphic/src/shape/neu_stadium_path_provider.dart';

/// Define a Neumorphic container box shape

class NeuBoxShape {
  final NeuPathProvider customShapePathProvider;

  const NeuBoxShape._(this.customShapePathProvider);

  const NeuBoxShape.circle() : this._(const NeuCirclePathProvider());

  const NeuBoxShape.path(NeuPathProvider pathProvider)
      : this._(pathProvider);

  const NeuBoxShape.rect() : this._(const NeuRectPathProvider());

  const NeuBoxShape.stadium() : this._(const NeuStadiumPathProvider());

  NeuBoxShape.roundRect(BorderRadius borderRadius)
      : this._(NeuRRectPathProvider(borderRadius));

  NeuBoxShape.beveled(BorderRadius borderRadius)
      : this._(NeuBeveledPathProvider(borderRadius));

  bool get isCustomPath =>
      !isStadium && !isRect && !isCircle && !isRoundRect && !isBeveled;

  bool get isStadium =>
      customShapePathProvider.runtimeType == NeuStadiumPathProvider;

  bool get isCircle =>
      customShapePathProvider.runtimeType == NeuCirclePathProvider;

  bool get isRect => customShapePathProvider.runtimeType == NeuRectPathProvider;

  bool get isRoundRect =>
      customShapePathProvider.runtimeType == NeuRRectPathProvider;

  bool get isBeveled =>
      customShapePathProvider.runtimeType == NeuBeveledPathProvider;

  static NeuBoxShape? lerp(
      NeuBoxShape? a, NeuBoxShape? b, double t) {
    if (a == null && b == null) return null;

    if (t == 0.0) return a;
    if (t == 1.0) return b;

    if (a == null) {
      if (b!.isCircle || b.isRect || b.isStadium || b.isCustomPath) {
        return b;
      } else {
        return NeuBoxShape.roundRect(BorderRadius.lerp(
          null,
          (b.customShapePathProvider as NeuRRectPathProvider).borderRadius,
          t,
        )!);
      }
    }
    if (a.isCircle || a.isRect || a.isStadium || a.isCustomPath) {
      return a;
    }

    if (b == null) {
      if (a.isCircle || a.isRect || a.isStadium || a.isCustomPath) {
        return a;
      } else {
        return NeuBoxShape.roundRect(BorderRadius.lerp(
          null,
          (a.customShapePathProvider as NeuRRectPathProvider).borderRadius,
          t,
        )!);
      }
    }
    if (b.isCircle || b.isRect || b.isStadium || b.isCustomPath) {
      return b;
    }

    if (a.isBeveled && b.isBeveled) {
      return NeuBoxShape.beveled(BorderRadius.lerp(
        (a.customShapePathProvider as NeuBeveledPathProvider).borderRadius,
        (b.customShapePathProvider as NeuBeveledPathProvider).borderRadius,
        t,
      )!);
    }

    return NeuBoxShape.roundRect(BorderRadius.lerp(
      (a.customShapePathProvider as NeuRRectPathProvider).borderRadius,
      (b.customShapePathProvider as NeuRRectPathProvider).borderRadius,
      t,
    )!);
  }
}
