part of '../index.dart';


class SubmitButtonCubit extends Cubit<SubmitButtonState> {
  SubmitButtonCubit(String text) : super(SubmitButtonState(isDisabled: false, isLoading: false, text: text));

  enableButton() {
    emit(state.copyWith(isDisabled: false));
  }

  disableButton() {
    emit(state.copyWith(isDisabled: true));
  }

  enableLoading() {
    emit(state.copyWith(isLoading: true));
  }

  disableLoading() {
    emit(state.copyWith(isLoading: false));
  }

  updateText(String newText) {
    emit(state.copyWith(text: newText));
  }
}

class SubmitButtonState {
  final bool isLoading;
  final bool isDisabled;
  final String text;
  SubmitButtonState({
    required this.isLoading,
    required this.isDisabled,
    required this.text,
  });

  SubmitButtonState copyWith({
    bool? isLoading,
    bool? isDisabled,
    String? text,
  }) {
    return SubmitButtonState(
      isLoading: isLoading ?? this.isLoading,
      isDisabled: isDisabled ?? this.isDisabled,
      text: text ?? this.text,
    );
  }

  @override
  String toString() => 'SubmitButtonState(isLoading: $isLoading, isDisabled: $isDisabled, text: $text)';

  @override
  bool operator ==(covariant SubmitButtonState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.isDisabled == isDisabled && other.text == text;
  }

  @override
  int get hashCode => isLoading.hashCode ^ isDisabled.hashCode ^ text.hashCode;
}
