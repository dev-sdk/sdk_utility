import 'package:flutter/material.dart';
import 'package:sdk_utility/sdk_utility.dart';

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

  ColorScheme _lightColorScheme = flexSchemeLight;
  ColorScheme get lightColorScheme => _lightColorScheme;
  setLightColorScheme(ColorScheme value) => _lightColorScheme = value;

  ColorScheme _darkColorScheme = flexSchemeLight;
  ColorScheme get darkColorScheme => _darkColorScheme;
  setDarkColorScheme(ColorScheme value) => _darkColorScheme = value;

  bool _useMaterial3 = true;
  bool get useMaterial3 => _useMaterial3;
  setUseMaterial3(bool useMaterial3) => _useMaterial3 = useMaterial3;
}
