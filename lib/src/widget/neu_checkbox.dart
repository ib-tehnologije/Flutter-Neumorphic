import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/src/widget/neu_container.dart';

import '../../flutter_neu.dart';
import '../neu_icons.dart';
import '../neu_light_source.dart';
import '../neu_shape.dart';
import 'neu_button.dart';

typedef void NeuCheckboxListener<T>(T value);

/// A Style used to customize a NeumorphicCheckbox
///
/// selectedDepth : the depth when checked
/// unselectedDepth : the depth when unchecked (default : theme.depth)
/// selectedColor : the color when checked (default: theme.accent)
///
class NeuCheckboxStyle {
  final double? selectedDepth;
  final double? unselectedDepth;
  final bool? disableDepth;
  final double? selectedIntensity;
  final double unselectedIntensity;
  final Color? selectedColor;
  final Color? disabledColor;
  final NeuLightSource? lightSource;
  final NeuBorder border;
  final NeuBoxShape? boxShape;

  const NeuCheckboxStyle({
    this.selectedDepth,
    this.border = const NeuBorder.none(),
    this.selectedColor,
    this.unselectedDepth,
    this.disableDepth,
    this.lightSource,
    this.disabledColor,
    this.boxShape,
    this.selectedIntensity = 1,
    this.unselectedIntensity = 0.7,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeuCheckboxStyle &&
          runtimeType == other.runtimeType &&
          selectedDepth == other.selectedDepth &&
          border == other.border &&
          unselectedDepth == other.unselectedDepth &&
          disableDepth == other.disableDepth &&
          selectedIntensity == other.selectedIntensity &&
          lightSource == other.lightSource &&
          unselectedIntensity == other.unselectedIntensity &&
          boxShape == other.boxShape &&
          selectedColor == other.selectedColor &&
          disabledColor == other.disabledColor;

  @override
  int get hashCode =>
      selectedDepth.hashCode ^
      unselectedDepth.hashCode ^
      border.hashCode ^
      lightSource.hashCode ^
      disableDepth.hashCode ^
      selectedIntensity.hashCode ^
      unselectedIntensity.hashCode ^
      boxShape.hashCode ^
      selectedColor.hashCode ^
      disabledColor.hashCode;
}

/// A Neumorphic Checkbox
///
/// takes a NeumorphicCheckboxStyle as `style`
/// takes the current checked state as `value`
///
/// notifies the parent when user interact with this widget with `onChanged`
///
/// ```
///  bool check1 = false;
///  bool check2 = false;
///  bool check3 = false;
///
///  Widget _buildChecks() {
///    return Row(
///      children: <Widget>[
///
///        NeumorphicCheckbox(
///          value: check1,
///          onChanged: (value) {
///            setState(() {
///              check1 = value;
///            });
///          },
///        ),
///
///        NeumorphicCheckbox(
///          value: check2,
///          onChanged: (value) {
///            setState(() {
///              check2 = value;
///            });
///          },
///        ),
///
///        NeumorphicCheckbox(
///          value: check3,
///          onChanged: (value) {
///            setState(() {
///              check3 = value;
///            });
///          },
///        ),
///
///      ],
///    );
///  }
/// ```
///
@immutable
class NeuCheckbox extends StatelessWidget {
  final bool value;
  final NeuCheckboxStyle style;
  final NeuCheckboxListener onChanged;
  final isEnabled;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;

  NeuCheckbox({
    this.style = const NeuCheckboxStyle(),
    required this.value,
    required this.onChanged,
    this.curve = Neu.DEFAULT_CURVE,
    this.duration = Neu.DEFAULT_DURATION,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.margin = const EdgeInsets.all(0),
    this.isEnabled = true,
  });

  bool get isSelected => this.value;

  void _onClick() {
    this.onChanged(!this.value);
  }

  @override
  Widget build(BuildContext context) {
    final NeuThemeData theme = NeuTheme.currentTheme(context);
    final selectedColor = this.style.selectedColor ?? theme.accentColor;

    final double selectedDepth =
        -1 * (this.style.selectedDepth ?? theme.depth).abs();
    final double unselectedDepth =
        (this.style.unselectedDepth ?? theme.depth).abs();
    final double selectedIntensity =
        (this.style.selectedIntensity ?? theme.intensity)
            .abs()
            .clamp(Neu.MIN_INTENSITY, Neu.MAX_INTENSITY);
    final double unselectedIntensity = this
        .style
        .unselectedIntensity
        .clamp(Neu.MIN_INTENSITY, Neu.MAX_INTENSITY);

    double depth = isSelected ? selectedDepth : unselectedDepth;
    if (!this.isEnabled) {
      depth = 0;
    }

    Color? color = isSelected ? selectedColor : null;
    if (!this.isEnabled) {
      color = null;
    }

    Color iconColor = isSelected ? theme.baseColor : selectedColor;
    if (!this.isEnabled) {
      iconColor = theme.disabledColor;
    }

    return NeuButton(
      padding: this.padding,
      pressed: isSelected,
      margin: this.margin,
      duration: this.duration,
      curve: this.curve,
      onPressed: () {
        if (this.isEnabled) {
          _onClick();
        }
      },
      drawSurfaceAboveChild: true,
      minDistance: selectedDepth.abs(),
      child: Icon(
        NeuIcons.check,
        color: iconColor,
        size: 20.0,
      ),
      style: NeuStyle(
        boxShape: this.style.boxShape,
        border: this.style.border,
        color: color,
        depth: depth,
        lightSource: this.style.lightSource ?? theme.lightSource,
        disableDepth: this.style.disableDepth,
        intensity: isSelected ? selectedIntensity : unselectedIntensity,
        shape: NeuShape.flat,
      ),
    );
  }
}
