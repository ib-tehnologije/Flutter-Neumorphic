import 'package:flutter_neumorphic/src/extensions/neu_color_extensions.dart';

import '../../flutter_neu.dart';
import 'neu_deletable.dart';

Widget _renderMainCard(BuildContext context, MaterialColor color,
    void Function()? tapped, Widget Function() render,
    {Key? key,
    double padding = 5,
    double innerPadding = 5,
    Function()? onDelete,
    String? onDeleteName,
    NeuStyle? neumorphicStyle}) {
  // dprint("renderMainMenuCard");
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Neu(
      drawSurfaceAboveChild: false,
      style: (neumorphicStyle ?? GlobalNeuSettings.neumorphicStyle).copyWith(
          color: color,
          surfaceIntensity: 0.5,
          boxShape: NeuBoxShape.roundRect(BorderRadius.circular(10))),
      child: NeuDeletable(
        Material(
          color: Colors.transparent,
          child: Ink(
            child: InkWell(
              highlightColor: color.lighten(10),
              splashColor: color.lighten(10),
              onTap: tapped,
              key: key,
              child: Padding(
                padding: EdgeInsets.all(innerPadding),
                child: render(),
              ),
            ),
          ),
        ),
        onDeleteName,
        onDelete,
        square: true,
      ),
    ),
  );
}

class NeuCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onDelete;
  final String? onDeleteName;
  final MaterialColor? color;
  final NeuStyle? neumorphicStyle;
  final double? outerPadding;
  final double? innerPadding;
  final EdgeInsets edgeInsets;

  const NeuCard(
      {Key? key,
      required this.child,
      this.onTap,
      this.onDelete,
      this.onDeleteName,
      this.color,
      this.outerPadding,
      this.innerPadding,
      this.neumorphicStyle,
      this.edgeInsets = const EdgeInsets.all(7.5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _renderMainCard(
      context,
      (color ?? Theme.of(context).primaryColor.toMaterial()),
      onTap,
      () => Padding(
        padding: edgeInsets,
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: child,
        ),
      ),
      padding: outerPadding ?? 0,
      innerPadding: innerPadding ?? 0,
      onDelete: onDelete,
      onDeleteName: onDeleteName,
      neumorphicStyle: neumorphicStyle
    );
  }
}
