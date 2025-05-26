part of "index.dart";

class ThemeHandler extends Cubit<ThemeData> {
  Brightness currentBrightness = Brightness.light;
  final BuildContext context;
  final AppTheme appTheme;
  ThemeHandler(this.context, this.appTheme) : super(appTheme.getLightThemeData) {
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
    emit(currentBrightness == Brightness.dark ? appTheme.getDarkThemeData : appTheme.getLightThemeData);
  }

  void toggleTheme() {
    setTheme(state.brightness == Brightness.dark ? Brightness.light : Brightness.dark);
  }

  void setTheme(Brightness brightness) {
    currentBrightness = brightness;
    _update();
  }

  bool get isDarkMode => currentBrightness == Brightness.dark;

  ColorScheme get getCurrentColorScheme => isDarkMode ? appTheme.darkScheme : appTheme.lightScheme;
}
