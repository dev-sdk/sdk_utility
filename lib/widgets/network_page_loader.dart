part of './index.dart';

class NoNetworkWidget extends StatelessWidget {
  final NetworkConnectionState state;
  const NoNetworkWidget(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    if (!state.showMsg || state.state == NetworkConnectionStatus.checking) return Container();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 25,
      alignment: Alignment.center,
      color: state.state == NetworkConnectionStatus.disconnected ? Colors.red : Colors.green,
      child: Text(
        state.state == NetworkConnectionStatus.disconnected ? "No network" : "Connection back.",
      ),
    );
  }
}
