part of "./index.dart";

class AppLoaderState {
  bool isLoading;
  bool preventPageClick;
  double? percentage;
  AppLoaderState({
    required this.isLoading,
    this.preventPageClick = false,
    this.percentage,
  });

  AppLoaderState copyWith({
    bool? isLoading,
    bool? preventPageClick,
    double? percentage,
  }) {
    return AppLoaderState(
      isLoading: isLoading ?? this.isLoading,
      percentage: percentage ?? this.percentage,
      preventPageClick: preventPageClick ?? this.preventPageClick,
    );
  }
}
