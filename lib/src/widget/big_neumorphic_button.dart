import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../helpers/needs_safe_area.dart';

class BigNeumorphicButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color? color;
  final bool? left;
  final bool? right;
  final bool? top;
  final bool? bottom;
  final bool? paddingless;
  final double? width;
  final Color? textColor;
  final bool isAtBottom;
  final IconData? icon;
  final IconData? rightIcon;
  final bool? noPaddingLeft;
  final bool? noPaddingRight;
  final bool? noPaddingTop;
  final bool? noPaddingBottom;
  final bool? expandText;
  final NeumorphicStyle? neumorphicStyle;
  final double? rectRadius;

  const BigNeumorphicButton(this.title, this.onPressed,
      {Key? key,
      this.color,
      this.left,
      this.right,
      this.top,
      this.bottom,
      this.paddingless,
      this.width,
      this.textColor,
      this.isAtBottom = false,
      this.icon,
      this.rightIcon,
      this.noPaddingLeft,
      this.noPaddingRight,
      this.noPaddingTop,
      this.noPaddingBottom,
      this.expandText,
      this.neumorphicStyle,
      this.rectRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double pDef = 15;

    var paddingLeft = pDef;
    var paddingRight = pDef;
    var paddingTop = pDef;
    var paddingBottom = pDef;

    if (left == true) paddingRight = 10;
    if (right == true) paddingLeft = 10;
    if (bottom == true) paddingTop = 0;
    if (top == true) paddingBottom = 10;

    if (paddingless == true) {
      paddingRight = 0;
      paddingLeft = 0;
      paddingTop = 0;
      paddingBottom = 0;
    }

    if (noPaddingLeft == true) paddingLeft = 0;
    if (noPaddingRight == true) paddingRight = 0;
    if (noPaddingTop == true) paddingTop = 0;
    if (noPaddingBottom == true) paddingBottom = 0;

    final iconSize = Theme.of(context).textTheme.bodyMedium!.fontSize! * 1.5;

    return Padding(
      padding: EdgeInsets.only(
          left: isAtBottom ? 5 : paddingLeft,
          top: isAtBottom ? 5 : paddingTop,
          right: isAtBottom ? 5 : paddingRight,
          bottom: isAtBottom
              ? needsSafeArea(context)
                  ? 30
                  : 5
              : paddingBottom),
      child: NeumorphicButton(
        style: (neumorphicStyle ?? GlobalNeumorphicSettings.neumorphicStyle)
            .copyWith(
                color: (color ?? Theme.of(context).colorScheme.primary)
                    .withOpacity(onPressed == null ? 0.5 : 1),
                intensity: 0.6,
                surfaceIntensity: 0.3,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(
                    rectRadius ?? GlobalNeumorphicSettings.rectRadius))),
        padding: EdgeInsets.all(15 -
            (rightIcon != null
                ? 3
                : icon != null
                    ? 2
                    : 0)),
        drawSurfaceAboveChild: false,
        onPressed: onPressed,
        child: Builder(builder: (context) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          return width != null
              ? SizedBox(
                  width: width ?? 0,
                  child: icon != null
                      ? Tooltip(
                          message: title,
                          child: Icon(
                            icon,
                            size: iconSize,
                            color: isDark
                                ? Colors.white
                                : textColor ??
                                    (color != null && color != Colors.white
                                        ? Colors.white
                                        : color == Colors.white
                                            ? Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.color
                                            : Theme.of(context)
                                                .backgroundColor),
                          ),
                        )
                      : renderText(context),
                )
              : icon != null
                  ? Tooltip(
                      message: title,
                      child: Icon(
                        icon,
                        size: iconSize,
                        color: getTextColor(context, isDark),
                      ),
                    )
                  : renderText(context);
        }),
        // minWidth: width,
        // onLongPress: this.onLongPress,
      ),
    );
  }

  Color getTextColor(BuildContext context, bool isDark) => (isDark
      ? textColor ??
          (color != null && color != Colors.white
              ? Colors.white
              : color == Colors.white
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).textTheme.bodyText1?.color) ??
          Theme.of(context).backgroundColor
      : textColor ??
          (color != null && color != Colors.white
              ? Colors.white
              : color == Colors.white
                  ? Theme.of(context).textTheme.bodyText1?.color
                  : Theme.of(context).backgroundColor) ??
          Colors.white);

  Widget renderText(BuildContext context) {
    final iconSize = const TextStyle().fontSize;

    return Builder(builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return rightIcon != null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (expandText == true)
                  Icon(
                    rightIcon,
                    size: iconSize,
                    color: Colors.transparent,
                  ),
                expandText == true
                    ? Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: getTextColor(context, isDark),
                              shadows: isDark
                                  ? [
                                      Shadow(
                                          color: Colors.black.withOpacity(
                                              textColor != null ? 1 : 0.7),
                                          blurRadius: 5),
                                    ]
                                  : []),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Text(
                        title,
                        style: TextStyle(
                            color: getTextColor(context, isDark),
                            shadows: isDark
                                ? [
                                    Shadow(
                                        color: Colors.black.withOpacity(
                                            textColor != null ? 1 : 0.7),
                                        blurRadius: 5),
                                  ]
                                : []),
                        textAlign: TextAlign.center,
                      ),
                Tooltip(
                  message: title,
                  child: Icon(
                    rightIcon,
                    size: iconSize,
                    color: getTextColor(context, isDark),
                  ),
                )
              ],
            )
          : Text(
              title,
              style: TextStyle(
                  color: getTextColor(context, isDark),
                  shadows: isDark
                      ? [
                          Shadow(
                              color: Colors.black
                                  .withOpacity(textColor != null ? 1 : 0.7),
                              blurRadius: 5),
                        ]
                      : []),
              textAlign: TextAlign.center,
            );
    });
  }
}
