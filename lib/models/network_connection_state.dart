part of "./index.dart";

enum NetworkConnectionStatus { disconnected, connected, checking }

class NetworkConnectionState {
  final bool showMsg;
  final NetworkConnectionStatus state;

  NetworkConnectionState(
    this.showMsg,
    this.state,
  );

  NetworkConnectionState copyWith({
    bool? showMsg,
    NetworkConnectionStatus? state,
  }) {
    return NetworkConnectionState(
      showMsg ?? this.showMsg,
      state ?? this.state,
    );
  }
}
