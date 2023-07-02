import 'package:flutter/material.dart';

bool needsSafeArea(BuildContext context) =>
    MediaQuery.of(context).viewPadding.bottom > 0;