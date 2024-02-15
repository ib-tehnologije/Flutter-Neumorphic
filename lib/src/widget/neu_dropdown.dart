import 'package:flutter/material.dart';

import '../../flutter_neu.dart';

class NeuDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String placeholder;
  final String? label;
  final NeuStyle? neuStyle;

  // Add any other properties you need

  NeuDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.label,
    this.placeholder = "Odaberite",
    this.value, // Add any other parameters for customization
    this.neuStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Neu(
            style: (neuStyle ?? GlobalNeuSettings.neumorphicStyle).copyWith(
              color: Theme.of(context).backgroundColor,
            ),
            child: Padding(
              padding: value == null
                  ? EdgeInsets.only(left: 10, right: 10)
                  : EdgeInsets.only(left: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  value: value,
                  borderRadius:
                      BorderRadius.circular(GlobalNeuSettings.rectRadius),
                  hint: value == null
                      ? Text(
                          placeholder,
                          style: Theme.of(context).inputDecorationTheme.hintStyle,
                        )
                      : null,
                  items: items,
                  isExpanded: true,
                  icon: value == null
                      ? null
                      : IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.clear,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          onPressed: () {
                            onChanged(null);
                          },
                          style: Theme.of(context).iconButtonTheme.style,
                        ),
                  onChanged:
                      onChanged, // Make sure to pass the onChanged callback
                  // Add any other DropdownButton customizations here
                ),
              ),
            ),
          ),
        ));
  }
}
