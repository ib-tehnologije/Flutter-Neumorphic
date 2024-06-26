import 'package:flutter_neumorphic/flutter_neu.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NeuSlideIcon extends StatelessWidget {
  final String title;
  final Color color;
  final void Function(BuildContext context) onTap;
  final IconData icon;
  final bool? square;
  final double? rectRadius;

  const NeuSlideIcon(this.title, this.color, this.icon, this.onTap, this.square,
      {Key? key, this.rectRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      label: title,
      backgroundColor: color,
      // foregroundColor: color,
      // backgroundColor: Colors.transparent,
      icon: icon,
      onPressed: onTap,
      // padding: const EdgeInsets.only(left: 2.5, right: 2.5, bottom: 5),
      borderRadius: square != true
          ? BorderRadius.circular(rectRadius ?? GlobalNeuSettings.rectRadius)
          : const BorderRadius.only(),
    );
  }
}
