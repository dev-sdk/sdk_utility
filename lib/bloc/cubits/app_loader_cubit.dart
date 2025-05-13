part of "index.dart";

class AppLoaderCubit extends Cubit<AppLoaderState> {
  AppLoaderCubit() : super(AppLoaderState(isLoading: false));

  enableLoading([bool preventPageClick = false]) {
    emit(state.copyWith(isLoading: true, preventPageClick: preventPageClick));
  }

  /// Percentage should be multiple of 100
  enablePercentageLoading(double percentage, {bool preventPageClick = false}) {
    emit(state.copyWith(isLoading: true, percentage: percentage, preventPageClick: preventPageClick));
  }

  disableLoading() {
    emit(state.copyWith(isLoading: false, preventPageClick: false, percentage: null));
  }
}
