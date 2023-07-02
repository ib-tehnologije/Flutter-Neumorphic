import 'package:flutter/foundation.dart';

void dprint(Object? message) {
  if (kDebugMode) {
    if (message?.toString().isNotEmpty != true) {
      print('dprint: empty message');
    } else {
      print(message);
    }
  } else {
    // some custom logging
  }
}
