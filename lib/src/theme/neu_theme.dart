
import '../../flutter_neu.dart';
import 'neu_inherited_theme.dart';

export 'neu_theme.dart';
export 'neu_theme_wrapper.dart';

/// The NeumorphicTheme (provider)
/// 1. Defines the used neumorphic theme used in child widgets
///
///   @see NeumorphicThemeData
///
///   NeumorphicTheme(
///     theme: NeumorphicThemeData(...),
///     darkTheme: NeumorphicThemeData(...),
///     currentTheme: CurrentTheme.LIGHT,
///     child: ...
///
/// 2. Provide by static methods the current theme
///
///   NeumorphicThemeData theme = NeumorphicTheme.getCurrentTheme(context);
///
/// 3. Provide by static methods the current theme's colors
///
///   Color baseColor = NeumorphicTheme.baseColor(context);
///   Color accent = NeumorphicTheme.accentColor(context);
///   Color variant = NeumorphicTheme.variantColor(context);
///
/// 4. Tells if the current theme is dark
///
///   bool dark = NeumorphicTheme.isUsingDark(context);
///
/// 5. Provides a way to update the current theme
///
///   NeumorphicTheme.of(context).updateCurrentTheme(
///     NeumorphicThemeData(
///       /* new values */
///     )
///   )
///
class NeuTheme extends StatefulWidget {
  final NeuThemeData theme;
  final NeuThemeData darkTheme;
  final Widget child;
  final ThemeMode themeMode;

  NeuTheme({
    Key? key,
    required this.child,
    this.theme = neumorphicDefaultTheme,
    this.darkTheme = neumorphicDefaultDarkTheme,
    this.themeMode = ThemeMode.system,
  });

  @override
  _NeuThemeState createState() => _NeuThemeState();

  static NeuInheritedTheme? of(BuildContext context) {
    try {
      return context
          .dependOnInheritedWidgetOfExactType<NeuInheritedTheme>();
    } catch (t) {
      return null;
    }
  }

  static void update(BuildContext context, NeuThemeUpdater updater) {
    final theme = of(context);
    if (theme == null) return;
    return theme.update(updater);
  }

  static bool isUsingDark(BuildContext context) {
    final theme = of(context);
    if (theme == null) return false;
    return theme.isUsingDark;
  }

  static Color accentColor(BuildContext context) {
    return currentTheme(context).accentColor;
  }

  static Color baseColor(BuildContext context) {
    return currentTheme(context).baseColor;
  }

  static Color variantColor(BuildContext context) {
    return currentTheme(context).variantColor;
  }

  static Color disabledColor(BuildContext context) {
    return currentTheme(context).disabledColor;
  }

  static double? intensity(BuildContext context) {
    return currentTheme(context).intensity;
  }

  static double? depth(BuildContext context) {
    return currentTheme(context).depth;
  }

  static double? embossDepth(BuildContext context) {
    if (currentTheme(context).depth == null) return null;
    return -currentTheme(context).depth.abs();
  }

  static Color defaultTextColor(BuildContext context) {
    return currentTheme(context).defaultTextColor;
  }

  static NeuThemeData currentTheme(BuildContext context) {
    final provider = NeuTheme.of(context);
    if (provider == null) return neumorphicDefaultTheme;
    return provider.current == null
        ? neumorphicDefaultTheme
        : provider.current!;
  }
}

double applyThemeDepthEnable(
    {required BuildContext context,
    required bool styleEnableDepth,
    required double depth}) {
  final NeuThemeData theme = NeuTheme.currentTheme(context);
  return wrapDepthWithThemeData(
      themeData: theme, styleEnableDepth: styleEnableDepth, depth: depth);
}

double wrapDepthWithThemeData(
    {required NeuThemeData themeData,
    required bool styleEnableDepth,
    required double depth}) {
  if (themeData.disableDepth) {
    return 0;
  } else {
    return depth;
  }
}

class _NeuThemeState extends State<NeuTheme> {
  late ThemeWrapper _themeHost;

  @override
  void initState() {
    super.initState();
    _themeHost = ThemeWrapper(
      theme: widget.theme,
      themeMode: widget.themeMode,
      darkTheme: widget.darkTheme,
    );
  }

  @override
  void didUpdateWidget(NeuTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _themeHost = ThemeWrapper(
        theme: widget.theme,
        themeMode: widget.themeMode,
        darkTheme: widget.darkTheme,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeuInheritedTheme(
      value: _themeHost,
      onChanged: (value) {
        setState(() {
          _themeHost = value;
        });
      },
      child: widget.child,
    );
  }
}
