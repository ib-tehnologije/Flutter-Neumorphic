
import '../../flutter_neumorphic.dart';
import '../helpers/dprint.dart';
import 'big_neumorphic_button.dart';

// Return može biti null, samo ako je == true je confirmed, == false je 'Ne', null je dismiss
Future<bool?> confirm(
  BuildContext context,
  String text, {
  bool? destructive,
  bool? noIsDestructive,
  ShapeBorder? rectShape,
  String? warningText,
  String? noText,
  String? yesText,
}) async {
  return await showDialog<bool?>(
    barrierDismissible: true,
    context: context,
    builder: (context) => AlertDialog(
      shape: (rectShape ?? GlobalNeumorphicSettings.rectShape),
      titlePadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.only(left: 20, bottom: 30, top: 0, right: 20),
      actionsPadding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      title: Padding(
        padding: const EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                warningText ?? 'Warning',
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context, null),
              )
            ]),
      ),
      content: Text(text, textAlign: TextAlign.center),
      actions: [
        Row(
          children: [
            Expanded(
                child: BigNeumorphicButton(
                    noText?.isNotEmpty == true ? noText! : "No",
                    () => Navigator.pop(context, false),
                    key: const Key('confirm_no'),
                    paddingless: true,
                    color: noIsDestructive == true
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.background,
                    textColor: noIsDestructive == true
                        ? null
                        : Theme.of(context).textTheme.bodyLarge?.color)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              key: const Key('confirm_yes'),
              child: BigNeumorphicButton(
                yesText?.isNotEmpty == true
                    ? yesText!
                    : "Yes",
                () => Navigator.pop(context, true),
                paddingless: true,
                color: destructive == true
                    ? Theme.of(context).colorScheme.error
                    : null,
              ),
            )
          ],
        )
      ],
    ),
  );
}

Future<bool> confirmForPop(BuildContext context, String text,
    {String? yesText,
    String? noText,
    bool? destructive,
    Future Function()? onYes,
    Future Function()? onNo,
    bool mustBeYesToPop = false,
    bool noIsDestructive = false,
    bool skip = false,
    Future Function()? onSkip}) async {
  try {
    if (skip) {
      await onSkip?.call();
      return true;
    }
    final res = await confirm(context, text,
        yesText: yesText,
        noText: noText,
        destructive: destructive,
        noIsDestructive: noIsDestructive);
    if (res == true) await onYes?.call();
    if (res == false) await onNo?.call();
    if (mustBeYesToPop) {
      return res == true;
    }
    return res != null;
  } catch (e, s) {
    dprint([e, s]);
  }
  return false;
}
