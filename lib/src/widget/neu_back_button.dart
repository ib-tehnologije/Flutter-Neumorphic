import 'package:flutter_neumorphic/flutter_neu.dart';

class NeuBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final NeuStyle? style;
  final EdgeInsets? padding;
  final bool forward;

  const NeuBackButton({
    Key? key,
    this.onPressed,
    this.style,
    this.padding,
    this.forward = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nThemeIcons = NeuTheme.of(context)!.current!.appBarTheme.icons;
    return NeuButton(
      style: style,
      padding: padding,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      child: forward ? nThemeIcons.forwardIcon : nThemeIcons.backIcon,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}
