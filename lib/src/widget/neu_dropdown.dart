import 'package:flutter/material.dart';

import '../../flutter_neu.dart';

class NeuDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final T? value;

  // Add any other properties you need

  NeuDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.value, // Add any other parameters for customization
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neu(
      style: GlobalNeuSettings.neumorphicStyle.copyWith(
        color: Colors.white,
      ),
      child: DropdownButton<T>(
        value: value,
        underline: Container(),
        borderRadius: BorderRadius.circular(10),
        items: items,
        onChanged: onChanged, // Make sure to pass the onChanged callback
        // Add any other DropdownButton customizations here
      ),
    );
  }
}
