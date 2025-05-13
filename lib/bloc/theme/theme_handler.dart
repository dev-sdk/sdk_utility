part of "index.dart";

class ThemeHandler extends Cubit<ThemeData> {
  Brightness currentBrightness = Brightness.light;
  final BuildContext context;
  ThemeHandler(this.context) : super(ThemeManager.light) {
    PlatformDispatcher dispatcher = PlatformDispatcher.instance;
    currentBrightness = dispatcher.platformBrightness;
    _update();
    dispatcher.onPlatformBrightnessChanged = () {
      final brightness = dispatcher.platformBrightness;
      currentBrightness = brightness;
      _update();
    };
  }
  void _update() {
    emit(currentBrightness == Brightness.dark ? ThemeManager.dark : ThemeManager.light);
  }

  void toggleTheme() {
    currentBrightness = state.brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    _update();
  }

  bool get isDarkMode => currentBrightness == Brightness.dark;
}

class ThemeManager {
  static ThemeData get light => ThemeData(useMaterial3: true, colorScheme: flexSchemeLight);
  static ThemeData get dark => ThemeData(useMaterial3: true, colorScheme: flexSchemeDark);
}
