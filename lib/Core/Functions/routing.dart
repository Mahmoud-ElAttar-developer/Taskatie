import 'package:flutter/material.dart';

void pushTo(BuildContext context, Widget newScreen) {
  Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => newScreen));
}

void pushToWithReplacment(BuildContext context, Widget newScreen) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => newScreen));
}
