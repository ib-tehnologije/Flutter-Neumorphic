import 'package:flutter_neumorphic/flutter_neu.dart';

class NeuCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final NeuStyle? style;
  final EdgeInsets? padding;

  const NeuCloseButton({
    Key? key,
    this.onPressed,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nThemeIcons = NeuTheme.of(context)!.current!.appBarTheme.icons;
    return NeuButton(
      style: style,
      padding: padding,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      child: nThemeIcons.closeIcon,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}
