import 'package:flutter/material.dart';

class PinController {
  final List<TextEditingController> controllers;

  PinController(int length)
      : controllers =
  List.generate(length, (_) => TextEditingController());

  String get pin => controllers.map((e) => e.text).join();
}
