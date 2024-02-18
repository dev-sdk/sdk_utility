part of './index.dart';

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
