library flutter_neumorphic;

import 'flutter_neumorphic.dart';

export 'package:flutter/material.dart'
    show
        TextTheme,
        ThemeMode,
        RouteFactory,
        GenerateAppTitle,
        InitialRouteListFactory;
export 'package:flutter/widgets.dart';

export 'src/colors.dart';
export 'src/neumorphic_box_shape.dart';
export 'src/shape.dart';
export 'src/shape/neumorphic_path_provider.dart';
export 'src/theme/app_bar.dart';
export 'src/theme/neumorphic_theme.dart';
export 'src/theme/theme.dart';
export 'src/widget/app.dart';
export 'src/widget/app_bar.dart';
export 'src/widget/back_button.dart';
export 'src/widget/background.dart';
export 'src/widget/button.dart';
export 'src/widget/checkbox.dart';
export 'src/widget/close_button.dart';
export 'src/widget/container.dart';
export 'src/widget/icon.dart';
export 'src/widget/indicator.dart';
export 'src/widget/progress.dart';
export 'src/widget/radio.dart';
export 'src/widget/range_slider.dart';
export 'src/widget/slider.dart';
export 'src/widget/switch.dart';
export 'src/widget/text.dart';
export 'src/widget/toggle.dart';
export 'src/widget/floating_action_button.dart';

export 'package:flutter/material.dart';

class GlobalNeumorphicSettings {
  static double rectRadius = 10;
  static NeumorphicStyle neumorphicStyle = NeumorphicStyle(
    lightSource: LightSource(-0.5, -2),
    shape: NeumorphicShape.convex,
    intensity: 0.5,
    surfaceIntensity: 0.135,
    shadowLightColor: Colors.transparent,
  );
  static ShapeBorder rectShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
    Radius.circular(rectRadius),
  ));
}
