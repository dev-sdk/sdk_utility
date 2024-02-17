import 'package:flutter/material.dart';

class UtilityConfig {
  UtilityConfig._internal();

  static UtilityConfig? _instance;
  static UtilityConfig instance = _instance!;

  factory UtilityConfig() {
    _instance ??= UtilityConfig._internal();
    return _instance!;
  }

  InputBorder _inputBorder = const OutlineInputBorder();
  InputBorder get getInputBorder => _inputBorder;
  setInputBorder(InputBorder border) => _inputBorder = border;
}
