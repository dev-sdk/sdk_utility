part of "index.dart";

class UtilityMaterialApp extends StatelessWidget {
  final String title;
  final RouterConfig<Object> routerConfig;
  final void Function(BuildContext)? pageContext;
  final List<BlocProvider>? initialProviders;
  final bool enableAppLoader;
  final Widget? loader;
  const UtilityMaterialApp({
    required this.title,
    required this.routerConfig,
    this.pageContext,
    this.initialProviders,
    this.enableAppLoader = false,
    this.loader,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      key: key,
      providers: [
        BlocProvider(create: (context) => NetworkConnectionCubit()),
        BlocProvider(create: (context) => ThemeHandler(context)),
        if (enableAppLoader) BlocProvider(create: (context) => AppLoaderCubit()),
        if (initialProviders != null) ...initialProviders!,
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<ThemeHandler, ThemeData>(
          builder: (ctx, state) {
            return MaterialApp.router(
              title: title,
              routerConfig: routerConfig,
              theme: state,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              builder: (context, child) {
                return SafeArea(
                  child: BlocBuilder<NetworkConnectionCubit, NetworkConnectionState>(
                    builder: (context, networkState) {
                      if (pageContext != null) pageContext!(context);
                      return checkNetworkAndLoader(networkState, child, context);
                    },
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }

  Widget checkNetworkAndLoader(NetworkConnectionState state, Widget? child, BuildContext context) {
    if (!enableAppLoader) return buildNetworkCheckWidgetWith(state, child, context, null);
    return BlocBuilder<AppLoaderCubit, AppLoaderState>(
      builder: (context, loaderState) {
        return buildNetworkCheckWidgetWith(state, child, context, loaderState);
      },
    );
  }

  Widget buildNetworkCheckWidgetWith(NetworkConnectionState state, Widget? child, BuildContext context, AppLoaderState? appLoaderState) {
    return Scaffold(
        appBar: !state.showMsg
            ? null
            : PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 17),
                child: SizedBox(height: 17, child: NoNetworkWidget(state)),
              ),
        body: AbsorbPointer(
          absorbing: appLoaderState?.preventPageClick ?? loader == null || false,
          child: Stack(
            children: [
              if (child != null) child,
              if (appLoaderState != null && appLoaderState.isLoading) ...[
                if (loader == null) SizedBox(height: 10, child: DefaultLinearAppLoader(appLoaderState)),
                if (appLoaderState.preventPageClick || loader != null)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: const Color.fromARGB(52, 107, 100, 100),
                    child: loader,
                  )
              ]
            ],
          ),
        ));
  }
}
