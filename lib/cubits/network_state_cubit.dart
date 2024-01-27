part of './index.dart';

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

  @override
  String toString() => 'NetworkConnectionState(displayMsg: $showMsg, state: $state)';

  @override
  bool operator ==(covariant NetworkConnectionState other) {
    if (identical(this, other)) return true;

    return other.showMsg == showMsg && other.state == state;
  }

  @override
  int get hashCode => showMsg.hashCode ^ state.hashCode;
}

class NetworkConnectionCubit extends Cubit<NetworkConnectionState> {
  int _isFirstTime = 0;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  NetworkConnectionCubit() : super(NetworkConnectionState(false, NetworkConnectionStatus.checking)) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    initConnectivity();
  }

  final Connectivity _connectivity = Connectivity();
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      emit(NetworkConnectionState(true, NetworkConnectionStatus.disconnected));
      _isFirstTime++;
    } else {
      if (_isFirstTime < 2) {
        emit(NetworkConnectionState(false, NetworkConnectionStatus.connected));
      } else {
        emit(NetworkConnectionState(true, NetworkConnectionStatus.connected));
        await createAsyncDelay(3000);
        if (state.state != NetworkConnectionStatus.disconnected) emit(state.copyWith(showMsg: false));
      }
    }
    _isFirstTime++;
  }

  bool get isConnected => state.state == NetworkConnectionStatus.connected;

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
