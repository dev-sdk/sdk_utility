part of "./index.dart";

class AppLoader extends StatelessWidget {
  final AppLoaderState state;
  const AppLoader(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      // color: Theme.of(context).primaryColor,
      value: state.percentage != null ? (state.percentage! / 100) : null,
    );
  }
}
