import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/src/widget/neu_slide_icon.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'neu_confirm.dart';

class NeuSlidableAction extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final String? checkText;
  final Function() executed;
  final Widget child;
  final bool? enabled;
  final bool closeOnScroll;
  final bool? square;

  const NeuSlidableAction(this.text, this.color, this.icon, this.executed,
      {Key? key,
      this.checkText,
      this.enabled,
      required this.child,
      this.closeOnScroll = true,
      this.square})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(text),
      // startActionPane: ActionPane(
      //   motion: const DrawerMotion(),
      //   children: [],
      // ),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const DrawerMotion(),
        children: [
          NeuSlideIcon(text, color, icon, (context) async {
            if (checkText != null) {
              if (await neuConfirm(context, checkText!, destructive: true) ==
                  true) {
                executed();
              }
            } else {
              executed();
            }
          }, square)
        ],
      ),
      closeOnScroll: closeOnScroll,
      enabled: enabled != false,
      child: child,
    );
  }
}
