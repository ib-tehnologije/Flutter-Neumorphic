import 'package:flutter/material.dart';

import '../../flutter_neu.dart';

class NeuDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String placeholder;
  final String? label;

  // Add any other properties you need

  NeuDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.label,
    this.placeholder = "Odaberite",
    this.value, // Add any other parameters for customization
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        child: Neu(
          style: GlobalNeuSettings.neumorphicStyle.copyWith(
            color: Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              borderRadius: BorderRadius.circular(10),
              hint: value == null ? Text(placeholder) : null,
              items: items,
              isExpanded: true,
              onChanged: onChanged, // Make sure to pass the onChanged callback
              // Add any other DropdownButton customizations here
            ),
          ),
        ));
  }
}
