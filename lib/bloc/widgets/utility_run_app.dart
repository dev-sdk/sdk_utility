part of "index.dart";

class UtilityRunApp {
  late final String _title;
  late final RouterConfig<Object> _routerConfig;
  late final void Function(BuildContext)? _pageContext;
  late final List<BlocProvider>? _initialProviders;
  late final bool _enableAppLoader;
  late final Widget? loader;
  late final Key? _key;

  UtilityRunApp._init(
    this._title,
    this._pageContext,
    this._routerConfig,
    this._initialProviders,
    this._enableAppLoader,
    this.loader,
    this._key,
  );

  static Future<void> init({
    required String title,
    required void Function(Widget) runApp,
    void Function(BuildContext)? appContext,
    required RouterConfig<Object> routerConfig,
    Future<void> Function()? onInit,
    List<BlocProvider>? initialProviders,
    bool enableAppLoader = true,
    Widget? loader,
    Key? key,
  }) async {
    var runAppRef = UtilityRunApp._init(title, appContext, routerConfig, initialProviders, enableAppLoader, loader, key);
    WidgetsFlutterBinding.ensureInitialized();
    if (onInit != null) await onInit();
    runApp(runAppRef.initMaterialApp());
  }

  Widget initMaterialApp() {
    return UtilityMaterialApp(
      title: _title,
      pageContext: _pageContext,
      routerConfig: _routerConfig,
      enableAppLoader: _enableAppLoader,
      initialProviders: _initialProviders,
      loader: loader,
      key: _key,
    );
  }
}
