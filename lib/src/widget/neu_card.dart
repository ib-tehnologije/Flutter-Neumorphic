import 'package:flutter_neumorphic/src/extensions/neu_color_extensions.dart';

import '../../flutter_neu.dart';
import 'neu_deletable.dart';

Widget _renderMainCard(BuildContext context, MaterialColor color,
    void Function()? tapped, Widget Function() render,
    {Key? key,
    double padding = 5,
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
          // border: NeumorphicBorder(color: orange, width: 3, isEnabled: true),
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
                padding: const EdgeInsets.only(
                    left: 5, top: 5, right: 5, bottom: 10),
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

class NeumorphicCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onDelete;
  final String? onDeleteName;
  final MaterialColor? color;
  final NeuStyle? neumorphicStyle;
  final double? allInnerPadding;
  final EdgeInsets edgeInsets;

  const NeumorphicCard(
      {Key? key,
      required this.child,
      this.onTap,
      this.onDelete,
      this.onDeleteName,
      this.color,
      this.allInnerPadding,
      this.neumorphicStyle,
      this.edgeInsets =
          const EdgeInsets.only(left: 7.5, right: 7.5, top: 2.5, bottom: 2.5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: _renderMainCard(
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
          padding: allInnerPadding ?? 0),
    );
  }
}
