part of 'index.dart';

class AppTheme {
  final ColorScheme lightScheme;
  final ColorScheme darkScheme;

  const AppTheme(this.lightScheme, this.darkScheme);

  ThemeData get getLightThemeData => getThemeData(lightScheme);
  ThemeData get getDarkThemeData => getThemeData(darkScheme);

  static const AppTheme getDefaultAppTheme = AppTheme(_lightColorScheme, _darkColorScheme);

  // Light ColorScheme
  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF4CB6AC),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFB2DFDB),
    onPrimaryContainer: Color(0xFF00201F),
    secondary: Color(0xFF4F5B62),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCFD8DC),
    onSecondaryContainer: Color(0xFF1C1F21),
    tertiary: Color(0xFF78909C),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFECEFF1),
    onTertiaryContainer: Color(0xFF1C1F21),
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFCD8DF),
    onErrorContainer: Color(0xFF370617),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF121212),
    surfaceContainerHighest: Color(0xFFE0E0E0),
    onSurfaceVariant: Color(0xFF454545),
    outline: Color(0xFF757575),
    shadow: Color(0xFF000000),
    inverseSurface: Color(0xFF303030),
    onInverseSurface: Color(0xFFECECEC),
    inversePrimary: Color(0xFF80CBC4),
    surfaceTint: Color(0xFF4CB6AC),
  );

  // Dark ColorScheme
  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF80CBC4),
    onPrimary: Color(0xFF00332E),
    primaryContainer: Color(0xFF004D40),
    onPrimaryContainer: Color(0xFFB2DFDB),
    secondary: Color(0xFFB0BEC5),
    onSecondary: Color(0xFF263238),
    secondaryContainer: Color(0xFF37474F),
    onSecondaryContainer: Color(0xFFCFD8DC),
    tertiary: Color(0xFF90A4AE),
    onTertiary: Color(0xFF263238),
    tertiaryContainer: Color(0xFF455A64),
    onTertiaryContainer: Color(0xFFECEFF1),
    error: Color(0xFFCF6679),
    onError: Color(0xFF370617),
    errorContainer: Color(0xFFB1384E),
    onErrorContainer: Color(0xFFFCD8DF),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFECECEC),
    surfaceContainerHighest: Color(0xFF424242),
    onSurfaceVariant: Color(0xFFC1C1C1),
    outline: Color(0xFF9E9E9E),
    shadow: Color(0xFF000000),
    inverseSurface: Color(0xFFECECEC),
    onInverseSurface: Color(0xFF303030),
    inversePrimary: Color(0xFF4CB6AC),
    surfaceTint: Color(0xFF80CBC4),
  );

  ThemeData getThemeData(ColorScheme colorScheme) {
    return ThemeData.from(colorScheme: colorScheme, useMaterial3: true).copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary.withAlpha(100),
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: colorScheme.primary,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(backgroundColor: colorScheme.primary)),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: colorScheme.surface,
        textColor: colorScheme.onSurface,
        iconColor: colorScheme.primary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        backgroundColor: colorScheme.surface,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? colorScheme.primary : colorScheme.outline,
        ),
        trackColor: WidgetStateProperty.all(colorScheme.primaryContainer),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(colorScheme.primary),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(colorScheme.primary),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        thumbColor: colorScheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(color: colorScheme.onSurface),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.primary,
        contentTextStyle: TextStyle(color: colorScheme.onPrimary),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        modalBackgroundColor: colorScheme.surfaceContainerHighest,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surface,
        selectedColor: colorScheme.primary,
        secondarySelectedColor: colorScheme.primaryContainer,
        labelStyle: TextStyle(color: colorScheme.onSurface),
        secondaryLabelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: colorScheme.surface,
        selectedIconTheme: IconThemeData(color: colorScheme.primary),
        unselectedIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
      ),
    );
  }
}
