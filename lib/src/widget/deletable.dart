import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/src/widget/slidable_action.dart';

class Deletable extends StatelessWidget {
  final Widget child;
  final Function()? deleted;
  final String? name;
  final bool? enabled;
  final bool? dontCheck;
  final bool? square;
  final String? deleteText;
  final String? areYouSureText;

  const Deletable(this.child, this.name, this.deleted,
      {Key? key,
      this.enabled,
      this.dontCheck,
      this.square,
      this.deleteText,
      this.areYouSureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (deleted == null) return child;

    return SlidableAction(this.deleteText ?? "Delete",
        Theme.of(context).colorScheme.error, Icons.clear, deleted!,
        enabled: enabled,
        checkText: dontCheck == true ? null : areYouSureText,
        square: square,
        child: child);
  }
}
