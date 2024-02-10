library flutter_neumorphic;

import 'package:flutter_neumorphic/src/neu_light_source.dart';
import 'package:flutter_neumorphic/src/neu_shape.dart';

import 'flutter_neu.dart';

export 'package:flutter/material.dart'
    show
        TextTheme,
        ThemeMode,
        RouteFactory,
        GenerateAppTitle,
        InitialRouteListFactory;
export 'package:flutter/widgets.dart';

export 'src/shape/neu_path_provider.dart';
export 'src/theme/neu_app_bar.dart';
export 'src/theme/neu_theme.dart';
export 'src/theme/neu_theme_data.dart';
export 'src/widget/neu_card.dart';
export 'src/widget/neu_app.dart';
export 'src/widget/neu_text_form_field.dart';
export 'src/widget/neu_big_button.dart';
export 'src/widget/neu_confirm.dart';
export 'src/widget/neu_slide_icon.dart';
export 'src/widget/neu_deletable.dart';
export 'src/widget/neu_slidable_action.dart';
export 'src/widget/neu_app_bar.dart';
export 'src/widget/neu_back_button.dart';
export 'src/widget/neu_background.dart';
export 'src/widget/neu_button.dart';
export 'src/widget/neu_checkbox.dart';
export 'src/widget/neu_close_button.dart';
export 'src/widget/neu_container.dart';
export 'src/widget/neu_icon.dart';
export 'src/widget/neu_indicator.dart';
export 'src/widget/neu_progress.dart';
export 'src/widget/neu_radio.dart';
export 'src/widget/neu_range_slider.dart';
export 'src/widget/neu_slider.dart';
export 'src/widget/neu_switch.dart';
export 'src/widget/neu_text.dart';
export 'src/widget/neu_toggle.dart';
export 'src/widget/neu_floating_action_button.dart';
export 'src/extensions/neu_color_extensions.dart';
export 'src/neu_shape.dart';
export 'src/neu_light_source.dart';
export 'src/neu_colors.dart';
export 'src/neu_box_shape.dart';
export 'src/widget/neu_dropdown.dart';

export 'package:flutter/material.dart';

class GlobalNeuSettings {
  static double rectRadius = 10;
  static NeuStyle neumorphicStyle = NeuStyle(
    lightSource: NeuLightSource(-0.5, -2),
    shape: NeuShape.convex,
    intensity: 0.5,
    surfaceIntensity: 0.135,
    shadowLightColor: Colors.transparent,
  );
  static ShapeBorder rectShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
    Radius.circular(rectRadius),
  ));
}
