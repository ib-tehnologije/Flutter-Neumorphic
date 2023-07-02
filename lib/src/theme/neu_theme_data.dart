import 'dart:ui';


import '../../flutter_neu.dart';
import '../neu_light_source.dart';
import '../neu_shape.dart';

//region theme
const double _defaultDepth = 4;
const double _defaultIntensity = 0.7;
const Color _defaultAccent = NeuColors.accent;
const Color _defaultVariant = NeuColors.variant;
const Color _defaultDisabledColor = NeuColors.disabled;
const Color _defaultTextColor = NeuColors.defaultTextColor;
const NeuLightSource _defaultLightSource = NeuLightSource.topLeft;
const Color _defaultBaseColor = NeuColors.background;
const double _defaultBorderSize = 0.3;

/// Used with the NeumorphicTheme
///
/// ```
/// NeumorphicTheme(
///   theme: NeumorphicThemeData(...)
///   darkTheme: : NeumorphicThemeData(...)
///   child: ...
/// )`
/// ``
///
/// Contains all default values used in child Neumorphic Elements as
/// default colors : baseColor, accentColor, variantColor
/// default depth & intensities, used to generate white / dark shadows
/// default lightsource, used to calculate the angle of the shadow
/// @see [LightSource]
///
@immutable
class NeuThemeData {
  final Color baseColor;
  final Color accentColor;
  final Color variantColor;
  final Color disabledColor;

  final Color shadowLightColor;
  final Color shadowDarkColor;
  final Color shadowLightColorEmboss;
  final Color shadowDarkColorEmboss;

  final NeuBoxShape? _boxShape;
  NeuBoxShape get boxShape =>
      _boxShape ?? NeuBoxShape.roundRect(BorderRadius.circular(8));
  final Color borderColor;
  final double borderWidth;

  final Color defaultTextColor; //TODO maybe use TextStyle here
  final double _depth;
  final double _intensity;
  final NeuLightSource lightSource;
  final bool disableDepth;

  /// Default text theme to use and apply across the app
  final TextTheme textTheme;

  /// Default button style to use and apply across the app
  final NeuStyle? buttonStyle;

  /// Default icon theme to use and apply across the app
  final IconThemeData iconTheme;
  final NeuAppBarThemeData appBarTheme;

  /// Get this theme's depth, clamp to min/max neumorphic constants
  double get depth => _depth.clamp(Neu.MIN_DEPTH, Neu.MAX_DEPTH);

  /// Get this theme's intensity, clamp to min/max neumorphic constants
  double get intensity =>
      _intensity.clamp(Neu.MIN_INTENSITY, Neu.MAX_INTENSITY);

  const NeuThemeData({
    this.baseColor = _defaultBaseColor,
    double depth = _defaultDepth,
    NeuBoxShape? boxShape,
    double intensity = _defaultIntensity,
    this.accentColor = _defaultAccent,
    this.variantColor = _defaultVariant,
    this.disabledColor = _defaultDisabledColor,
    this.shadowLightColor = NeuColors.decorationMaxWhiteColor,
    this.shadowDarkColor = NeuColors.decorationMaxDarkColor,
    this.shadowLightColorEmboss = NeuColors.embossMaxWhiteColor,
    this.shadowDarkColorEmboss = NeuColors.embossMaxDarkColor,
    this.defaultTextColor = _defaultTextColor,
    this.lightSource = _defaultLightSource,
    this.textTheme = const TextTheme(),
    this.iconTheme = const IconThemeData(),
    this.buttonStyle,
    this.appBarTheme = const NeuAppBarThemeData(),
    this.borderColor = NeuColors.defaultBorder,
    this.borderWidth = _defaultBorderSize,
    this.disableDepth = false,
  })  : this._depth = depth,
        this._boxShape = boxShape,
        this._intensity = intensity;

  const NeuThemeData.dark({
    this.baseColor = NeuColors.darkBackground,
    double depth = _defaultDepth,
    NeuBoxShape? boxShape,
    double intensity = _defaultIntensity,
    this.accentColor = _defaultAccent,
    this.textTheme = const TextTheme(),
    this.buttonStyle,
    this.iconTheme = const IconThemeData(),
    this.appBarTheme = const NeuAppBarThemeData(),
    this.variantColor = NeuColors.darkVariant,
    this.disabledColor = NeuColors.darkDisabled,
    this.shadowLightColor = NeuColors.decorationMaxWhiteColor,
    this.shadowDarkColor = NeuColors.decorationMaxDarkColor,
    this.shadowLightColorEmboss = NeuColors.embossMaxWhiteColor,
    this.shadowDarkColorEmboss = NeuColors.embossMaxDarkColor,
    this.defaultTextColor = NeuColors.darkDefaultTextColor,
    this.lightSource = _defaultLightSource,
    this.borderColor = NeuColors.darkDefaultBorder,
    this.borderWidth = _defaultBorderSize,
    this.disableDepth = false,
  })  : this._depth = depth,
        this._boxShape = boxShape,
        this._intensity = intensity;

  @override
  String toString() {
    return 'NeumorphicTheme{baseColor: $baseColor, boxShape: $boxShape, disableDepth: $disableDepth, accentColor: $accentColor, variantColor: $variantColor, disabledColor: $disabledColor, _depth: $_depth, intensity: $intensity, lightSource: $lightSource}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeuThemeData &&
          runtimeType == other.runtimeType &&
          baseColor == other.baseColor &&
          boxShape == other.boxShape &&
          textTheme == other.textTheme &&
          iconTheme == other.iconTheme &&
          buttonStyle == other.buttonStyle &&
          appBarTheme == other.appBarTheme &&
          accentColor == other.accentColor &&
          shadowDarkColor == other.shadowDarkColor &&
          shadowLightColor == other.shadowLightColor &&
          shadowDarkColorEmboss == other.shadowDarkColorEmboss &&
          shadowLightColorEmboss == other.shadowLightColorEmboss &&
          disabledColor == other.disabledColor &&
          variantColor == other.variantColor &&
          disableDepth == other.disableDepth &&
          defaultTextColor == other.defaultTextColor &&
          borderWidth == other.borderWidth &&
          borderColor == other.borderColor &&
          _depth == other._depth &&
          _intensity == other._intensity &&
          lightSource == other.lightSource;

  @override
  int get hashCode =>
      baseColor.hashCode ^
      textTheme.hashCode ^
      iconTheme.hashCode ^
      buttonStyle.hashCode ^
      appBarTheme.hashCode ^
      accentColor.hashCode ^
      variantColor.hashCode ^
      disabledColor.hashCode ^
      shadowDarkColor.hashCode ^
      shadowLightColor.hashCode ^
      shadowDarkColorEmboss.hashCode ^
      shadowLightColorEmboss.hashCode ^
      defaultTextColor.hashCode ^
      disableDepth.hashCode ^
      borderWidth.hashCode ^
      borderColor.hashCode ^
      _depth.hashCode ^
      boxShape.hashCode ^
      _intensity.hashCode ^
      lightSource.hashCode;

  /// Create a copy of this theme
  /// With possibly new values given from this method's arguments
  NeuThemeData copyWith({
    Color? baseColor,
    Color? accentColor,
    Color? variantColor,
    Color? disabledColor,
    Color? shadowLightColor,
    Color? shadowDarkColor,
    Color? shadowLightColorEmboss,
    Color? shadowDarkColorEmboss,
    Color? defaultTextColor,
    NeuBoxShape? boxShape,
    TextTheme? textTheme,
    NeuStyle? buttonStyle,
    IconThemeData? iconTheme,
    NeuAppBarThemeData? appBarTheme,
    NeuStyle? defaultStyle,
    bool? disableDepth,
    double? depth,
    double? intensity,
    Color? borderColor,
    double? borderSize,
    NeuLightSource? lightSource,
  }) {
    return new NeuThemeData(
      baseColor: baseColor ?? this.baseColor,
      textTheme: textTheme ?? this.textTheme,
      iconTheme: iconTheme ?? this.iconTheme,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      boxShape: boxShape ?? this.boxShape,
      appBarTheme: appBarTheme ?? this.appBarTheme,
      accentColor: accentColor ?? this.accentColor,
      variantColor: variantColor ?? this.variantColor,
      disabledColor: disabledColor ?? this.disabledColor,
      defaultTextColor: defaultTextColor ?? this.defaultTextColor,
      disableDepth: disableDepth ?? this.disableDepth,
      shadowDarkColor: shadowDarkColor ?? this.shadowDarkColor,
      shadowLightColor: shadowLightColor ?? this.shadowLightColor,
      shadowDarkColorEmboss:
          shadowDarkColorEmboss ?? this.shadowDarkColorEmboss,
      shadowLightColorEmboss:
          shadowLightColorEmboss ?? this.shadowLightColorEmboss,
      depth: depth ?? this._depth,
      borderWidth: borderSize ?? this.borderWidth,
      borderColor: borderColor ?? this.borderColor,
      intensity: intensity ?? this._intensity,
      lightSource: lightSource ?? this.lightSource,
    );
  }

  /// Create a copy of this theme
  /// With possibly new values given from the given second theme
  NeuThemeData copyFrom({
    required NeuThemeData other,
  }) {
    return new NeuThemeData(
      baseColor: other.baseColor,
      accentColor: other.accentColor,
      variantColor: other.variantColor,
      disableDepth: other.disableDepth,
      disabledColor: other.disabledColor,
      defaultTextColor: other.defaultTextColor,
      shadowDarkColor: other.shadowDarkColor,
      shadowLightColor: other.shadowLightColor,
      shadowDarkColorEmboss: other.shadowDarkColorEmboss,
      shadowLightColorEmboss: other.shadowLightColorEmboss,
      textTheme: other.textTheme,
      iconTheme: other.iconTheme,
      buttonStyle: other.buttonStyle,
      appBarTheme: other.appBarTheme,
      depth: other.depth,
      boxShape: other.boxShape,
      borderColor: other.borderColor,
      borderWidth: other.borderWidth,
      intensity: other.intensity,
      lightSource: other.lightSource,
    );
  }
}
//endregion

//region style
const NeuShape _defaultShape = NeuShape.flat;
//const double _defaultBorderRadius = 5;

const neumorphicDefaultTheme = NeuThemeData();
const neumorphicDefaultDarkTheme = NeuThemeData.dark();

class NeuBorder {
  final bool isEnabled;
  final Color? color;
  final double? width;

  const NeuBorder({
    this.isEnabled = true,
    this.color,
    this.width,
  });

  const NeuBorder.none()
      : this.isEnabled = true,
        this.color = const Color(0x00000000),
        this.width = 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeuBorder &&
          runtimeType == other.runtimeType &&
          isEnabled == other.isEnabled &&
          color == other.color &&
          width == other.width;

  @override
  int get hashCode => isEnabled.hashCode ^ color.hashCode ^ width.hashCode;

  @override
  String toString() {
    return 'NeumorphicBorder{isEnabled: $isEnabled, color: $color, width: $width}';
  }

  static NeuBorder? lerp(
      NeuBorder? a, NeuBorder? b, double t) {
    if (a == null && b == null) return null;

    if (t == 0.0) return a;
    if (t == 1.0) return b;

    return NeuBorder(
      color: Color.lerp(a!.color, b!.color, t),
      isEnabled: a.isEnabled,
      width: lerpDouble(a.width, b.width, t),
    );
  }

  NeuBorder copyWithThemeIfNull({Color? color, double? width}) {
    return NeuBorder(
      isEnabled: this.isEnabled,
      color: this.color ?? color,
      width: this.width ?? width,
    );
  }
}

class NeuStyle {
  final Color? color;
  final double? _depth;
  final double? _intensity;
  final double _surfaceIntensity;
  final NeuLightSource lightSource;
  final bool? disableDepth;

  final NeuBorder border;

  final bool oppositeShadowLightSource;

  final NeuShape shape;
  final NeuBoxShape? boxShape;
  final NeuThemeData? theme;

  //override the "white" color
  final Color? shadowLightColor;

  //override the "dark" color
  final Color? shadowDarkColor;

  //override the "white" color
  final Color? shadowLightColorEmboss;

  //override the "dark" color
  final Color? shadowDarkColorEmboss;

  const NeuStyle({
    this.shape = _defaultShape,
    this.lightSource = NeuLightSource.topLeft,
    this.border = const NeuBorder.none(),
    this.color,
    this.boxShape, //nullable by default, will use the one defined in theme if not set
    this.shadowLightColor,
    this.shadowDarkColor,
    this.shadowLightColorEmboss,
    this.shadowDarkColorEmboss,
    double? depth,
    double? intensity,
    double surfaceIntensity = 0.25,
    this.disableDepth,
    this.oppositeShadowLightSource = false,
  })  : this._depth = depth,
        this.theme = null,
        this._intensity = intensity,
        this._surfaceIntensity = surfaceIntensity;

  // with theme constructor is only available privately, please use copyWithThemeIfNull
  const NeuStyle._withTheme({
    this.theme,
    this.shape = _defaultShape,
    this.lightSource = NeuLightSource.topLeft,
    this.color,
    this.boxShape,
    this.border = const NeuBorder.none(),
    this.shadowLightColor,
    this.shadowDarkColor,
    this.shadowLightColorEmboss,
    this.shadowDarkColorEmboss,
    this.oppositeShadowLightSource = false,
    this.disableDepth,
    double? depth,
    double? intensity,
    double surfaceIntensity = 0.25,
  })  : this._depth = depth,
        this._intensity = intensity,
        this._surfaceIntensity = surfaceIntensity;

  double? get depth =>
      _depth?.clamp(Neu.MIN_DEPTH, Neu.MAX_DEPTH);

  double? get intensity =>
      _intensity?.clamp(Neu.MIN_INTENSITY, Neu.MAX_INTENSITY);

  double get surfaceIntensity => _surfaceIntensity.clamp(
      Neu.MIN_INTENSITY, Neu.MAX_INTENSITY);

  NeuStyle copyWithThemeIfNull(NeuThemeData theme) {
    return NeuStyle._withTheme(
        theme: theme,
        color: this.color ?? theme.baseColor,
        boxShape: this.boxShape ?? theme.boxShape,
        shape: this.shape,
        border: this.border.copyWithThemeIfNull(
            color: theme.borderColor, width: theme.borderWidth),
        shadowDarkColor: this.shadowDarkColor ?? theme.shadowDarkColor,
        shadowLightColor: this.shadowLightColor ?? theme.shadowLightColor,
        shadowDarkColorEmboss:
            this.shadowDarkColorEmboss ?? theme.shadowDarkColorEmboss,
        shadowLightColorEmboss:
            this.shadowLightColorEmboss ?? theme.shadowLightColorEmboss,
        depth: this.depth ?? theme.depth,
        intensity: this.intensity ?? theme.intensity,
        disableDepth: this.disableDepth ?? theme.disableDepth,
        surfaceIntensity: this.surfaceIntensity,
        oppositeShadowLightSource: this.oppositeShadowLightSource,
        lightSource: this.lightSource);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeuStyle &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          boxShape == other.boxShape &&
          border == other.border &&
          shadowDarkColor == other.shadowDarkColor &&
          shadowLightColor == other.shadowLightColor &&
          shadowDarkColorEmboss == other.shadowDarkColorEmboss &&
          shadowLightColorEmboss == other.shadowLightColorEmboss &&
          disableDepth == other.disableDepth &&
          _depth == other._depth &&
          _intensity == other._intensity &&
          _surfaceIntensity == other._surfaceIntensity &&
          lightSource == other.lightSource &&
          oppositeShadowLightSource == other.oppositeShadowLightSource &&
          shape == other.shape &&
          theme == other.theme;

  @override
  int get hashCode =>
      color.hashCode ^
      shadowDarkColor.hashCode ^
      boxShape.hashCode ^
      shadowLightColor.hashCode ^
      shadowDarkColorEmboss.hashCode ^
      shadowLightColorEmboss.hashCode ^
      _depth.hashCode ^
      border.hashCode ^
      _intensity.hashCode ^
      disableDepth.hashCode ^
      _surfaceIntensity.hashCode ^
      lightSource.hashCode ^
      oppositeShadowLightSource.hashCode ^
      shape.hashCode ^
      theme.hashCode;

  NeuStyle copyWith({
    Color? color,
    NeuBorder? border,
    NeuBoxShape? boxShape,
    Color? shadowLightColor,
    Color? shadowDarkColor,
    Color? shadowLightColorEmboss,
    Color? shadowDarkColorEmboss,
    double? depth,
    double? intensity,
    double? surfaceIntensity,
    NeuLightSource? lightSource,
    bool? disableDepth,
    double? borderRadius,
    bool? oppositeShadowLightSource,
    NeuShape? shape,
  }) {
    return NeuStyle._withTheme(
      color: color ?? this.color,
      border: border ?? this.border,
      boxShape: boxShape ?? this.boxShape,
      shadowDarkColor: shadowDarkColor ?? this.shadowDarkColor,
      shadowLightColor: shadowLightColor ?? this.shadowLightColor,
      shadowDarkColorEmboss:
          shadowDarkColorEmboss ?? this.shadowDarkColorEmboss,
      shadowLightColorEmboss:
          shadowLightColorEmboss ?? this.shadowLightColorEmboss,
      depth: depth ?? this.depth,
      theme: this.theme,
      intensity: intensity ?? this.intensity,
      surfaceIntensity: surfaceIntensity ?? this.surfaceIntensity,
      disableDepth: disableDepth ?? this.disableDepth,
      lightSource: lightSource ?? this.lightSource,
      oppositeShadowLightSource:
          oppositeShadowLightSource ?? this.oppositeShadowLightSource,
      shape: shape ?? this.shape,
    );
  }

  @override
  String toString() {
    return 'NeumorphicStyle{color: $color, boxShape: $boxShape, _depth: $_depth, intensity: $intensity, disableDepth: $disableDepth, lightSource: $lightSource, shape: $shape, theme: $theme, oppositeShadowLightSource: $oppositeShadowLightSource}';
  }

  NeuStyle applyDisableDepth() {
    if (disableDepth == true) {
      return this.copyWith(depth: 0);
    } else {
      return this;
    }
  }
}
//endregion
