import 'package:flutter/widgets.dart';

import '../../flutter_neu.dart';
import '../neu_light_source.dart';
import '../neu_shape.dart';
import 'neu_button.dart';
import 'neu_container.dart';

typedef void NeuRadioListener<T>(T value);

/// A Style used to customize a [NeuRadio]
///
/// [selectedDepth] : the depth when checked
/// [unselectedDepth] : the depth when unchecked (default : theme.depth)
///
/// [intensity] : a customizable neumorphic intensity for this widget
///
/// [boxShape] : a customizable neumorphic boxShape for this widget
///   @see [NeuBoxShape]
///
/// [shape] : a customizable neumorphic shape for this widget
///   @see [NeuShape] (concave, convex, flat)
///
class NeuRadioStyle {
  final double? selectedDepth;
  final double? unselectedDepth;
  final bool disableDepth;

  final Color? selectedColor; //null for default
  final Color? unselectedColor; //null for unchanged color

  final double? intensity;
  final NeuShape? shape;

  final NeuBorder border;
  final NeuBoxShape? boxShape;

  final NeuLightSource? lightSource;

  const NeuRadioStyle({
    this.selectedDepth,
    this.unselectedDepth,
    this.selectedColor,
    this.unselectedColor,
    this.lightSource,
    this.disableDepth = false,
    this.boxShape,
    this.border = const NeuBorder.none(),
    this.intensity,
    this.shape,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeuRadioStyle &&
          runtimeType == other.runtimeType &&
          disableDepth == other.disableDepth &&
          lightSource == other.lightSource &&
          border == other.border &&
          selectedDepth == other.selectedDepth &&
          unselectedDepth == other.unselectedDepth &&
          selectedColor == other.selectedColor &&
          unselectedColor == other.unselectedColor &&
          boxShape == other.boxShape &&
          intensity == other.intensity &&
          shape == other.shape;

  @override
  int get hashCode =>
      disableDepth.hashCode ^
      selectedDepth.hashCode ^
      lightSource.hashCode ^
      selectedColor.hashCode ^
      unselectedColor.hashCode ^
      boxShape.hashCode ^
      border.hashCode ^
      unselectedDepth.hashCode ^
      intensity.hashCode ^
      shape.hashCode;
}

/// A Neumorphic Radio
///
/// It takes a `value` and a `groupValue`
/// if (value == groupValue) => checked
///
/// takes a NeumorphicRadioStyle as `style`
///
/// notifies the parent when user interact with this widget with `onChanged`
///
/// ```
/// int _groupValue;
///
/// Widget _buildRadios() {
///    return Row(
///      children: <Widget>[
///
///        NeumorphicRadio(
///          child: SizedBox(
///            height: 50,
///            width: 50,
///            child: Center(
///              child: Text("1"),
///            ),
///          ),
///          value: 1,
///          groupValue: _groupValue,
///          onChanged: (value) {
///            setState(() {
///              _groupValue = value;
///            });
///          },
///        ),
///
///        NeumorphicRadio(
///          child: SizedBox(
///            height: 50,
///            width: 50,
///            child: Center(
///              child: Text("2"),
///            ),
///          ),
///          value: 2,
///          groupValue: _groupValue,
///          onChanged: (value) {
///            setState(() {
///              _groupValue = value;
///            });
///          },
///        ),
///
///        NeumorphicRadio(
///          child: SizedBox(
///            height: 50,
///            width: 50,
///            child: Center(
///              child: Text("3"),
///            ),
///          ),
///          value: 3,
///          groupValue: _groupValue,
///          onChanged: (value) {
///            setState(() {
///              _groupValue = value;
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
class NeuRadio<T> extends StatelessWidget {
  final Widget? child;
  final T? value;
  final T? groupValue;
  final EdgeInsets padding;
  final NeuRadioStyle style;
  final NeuRadioListener<T?>? onChanged;
  final bool isEnabled;

  final Duration duration;
  final Curve curve;

  NeuRadio({
    this.child,
    this.style = const NeuRadioStyle(),
    this.value,
    this.curve = Neu.DEFAULT_CURVE,
    this.duration = Neu.DEFAULT_DURATION,
    this.padding = EdgeInsets.zero,
    this.groupValue,
    this.onChanged,
    this.isEnabled = true,
  });

  bool get isSelected => this.value != null && this.value == this.groupValue;

  void _onClick() {
    if (this.onChanged != null) {
      if (this.value == this.groupValue) {
        //unselect
        this.onChanged!(null);
      } else {
        this.onChanged!(this.value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final NeuThemeData theme = NeuTheme.currentTheme(context);

    final double selectedDepth =
        -1 * (this.style.selectedDepth ?? theme.depth).abs();
    final double unselectedDepth =
        (this.style.unselectedDepth ?? theme.depth).abs();

    double depth = isSelected ? selectedDepth : unselectedDepth;
    if (!this.isEnabled) {
      depth = 0;
    }

    final Color unselectedColor = this.style.unselectedColor ?? theme.baseColor;
    final Color selectedColor = this.style.selectedColor ?? unselectedColor;

    final Color color = isSelected ? selectedColor : unselectedColor;

    return NeuButton(
      onPressed: () {
        _onClick();
      },
      duration: this.duration,
      curve: this.curve,
      padding: this.padding,
      pressed: isSelected,
      minDistance: selectedDepth,
      child: this.child,
      style: NeuStyle(
        border: this.style.border,
        color: color,
        boxShape: this.style.boxShape,
        lightSource: this.style.lightSource ?? theme.lightSource,
        disableDepth: this.style.disableDepth,
        intensity: this.style.intensity,
        depth: depth,
        shape: this.style.shape ?? NeuShape.flat,
      ),
    );
  }
}
