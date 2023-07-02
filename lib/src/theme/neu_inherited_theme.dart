import 'package:flutter_neumorphic/flutter_neu.dart';

import '../decoration/neu_emboss_decoration_painter.dart';


export 'neu_theme_data.dart';
export 'neu_theme_wrapper.dart';

typedef NeuThemeUpdater = NeuThemeData Function(
    NeuThemeData? current);

class NeuInheritedTheme extends InheritedWidget {
  final Widget child;
  final ThemeWrapper value;
  final ValueChanged<ThemeWrapper> onChanged;

  NeuInheritedTheme(
      {Key? key,
      required this.child,
      required this.value,
      required this.onChanged})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(NeuInheritedTheme old) => value != old.value;

  NeuThemeData? get current {
    return this.value.current;
  }

  bool get isUsingDark {
    return value.useDark;
  }

  ThemeMode get themeMode => value.themeMode;

  set themeMode(ThemeMode currentTheme) {
    this.onChanged(value.copyWith(currentTheme: currentTheme));
  }

  void updateCurrentTheme(NeuThemeData update) {
    if (value.useDark) {
      final newValue = value.copyWith(darkTheme: update);
      //this.value = newValue;
      this.onChanged(newValue);
    } else {
      final newValue = value.copyWith(theme: update);
      //this.value = newValue;
      this.onChanged(newValue);
    }
  }

  void update(NeuThemeUpdater themeUpdater) {
    final update = themeUpdater(value.current);
    if (value.useDark) {
      final newValue = value.copyWith(darkTheme: update);
      //this.value = newValue;
      this.onChanged(newValue);
    } else {
      final newValue = value.copyWith(theme: update);
      //this.value = newValue;
      this.onChanged(newValue);
    }
  }
}
