import 'dart:io';


import 'package:flutter_neumorphic/flutter_neu.dart';

@immutable
class NeuAppBarThemeData {
  final Color color;
  final IconThemeData? iconTheme;
  final NeuStyle buttonStyle;
  final EdgeInsets buttonPadding;
  final bool? centerTitle;
  final TextStyle? textStyle;
  final NeuAppBarIcons icons;

  const NeuAppBarThemeData({
    this.color = Colors.transparent,
    this.iconTheme,
    this.textStyle,
    this.buttonStyle = const NeuStyle(),
    this.centerTitle,
    this.buttonPadding = const EdgeInsets.all(0),
    this.icons = const NeuAppBarIcons(),
  });
}

class NeuAppBarIcons {
  final Icon closeIcon;
  final Icon menuIcon;
  final Icon? _backIcon;
  final Icon? _forwardIcon;

  const NeuAppBarIcons({
    this.menuIcon = const Icon(Icons.menu),
    this.closeIcon = const Icon(Icons.close),
    Icon? backIcon,
    Icon? forwardIcon,
  })  : _backIcon = backIcon,
        _forwardIcon = forwardIcon;

  //if back icon null then get platform oriented icon
  Icon get backIcon => _backIcon ?? _getBackIcon;
  Icon get _getBackIcon => Platform.isIOS || Platform.isMacOS
      ? const Icon(Icons.arrow_back_ios)
      : const Icon(Icons.arrow_back);

  Icon get forwardIcon => _forwardIcon ?? _getForwardIcon;
  Icon get _getForwardIcon => Platform.isIOS || Platform.isMacOS
      ? const Icon(Icons.arrow_forward_ios)
      : const Icon(Icons.arrow_forward);

  NeuAppBarIcons copyWith({
    Icon? backIcon,
    Icon? closeIcon,
    Icon? menuIcon,
    Icon? forwardIcon,
  }) {
    return NeuAppBarIcons(
      backIcon: backIcon ?? this.backIcon,
      closeIcon: closeIcon ?? this.closeIcon,
      menuIcon: menuIcon ?? this.menuIcon,
      forwardIcon: forwardIcon ?? this.forwardIcon,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NeuAppBarIcons &&
        o.backIcon == backIcon &&
        o.closeIcon == closeIcon &&
        o.menuIcon == menuIcon &&
        o.forwardIcon == forwardIcon;
  }

  @override
  int get hashCode =>
      backIcon.hashCode ^
      closeIcon.hashCode ^
      menuIcon.hashCode ^
      forwardIcon.hashCode;

  @override
  String toString() =>
      'NeumorphicAppBarIcons(backIcon: $backIcon, closeIcon: $closeIcon, menuIcon: $menuIcon, forwardIcon: $forwardIcon)';
}
